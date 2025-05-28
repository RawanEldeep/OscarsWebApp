from flask import Flask, render_template, request, redirect, url_for, session
import mysql.connector

App = Flask(__name__, static_folder = 'static')
App.secret_key = 'rowen_oscar_db_sp15'


def ConnectDB(): 
    return mysql.connector.connect(
        host = "sql.freedb.tech", 
        user = "freedb_Rawan_FreeDb_User", 
        password = "WRQWWMn*Hb8q%U9", 
        database = "freedb_OscarsDB"
    )

@App.route('/')
def home(): 
    return render_template("index.html")

@App.route('/Dashboard')
def Dashboard():
    print("SESSION ON DASHBOARD:", session.get('Email'))
    return render_template('Dashboard.html')

@App.route('/NotLoggedIn')
def NotLoggedIn(): 
   return render_template('ErrorMessage.html')

@App.route('/register', methods=['GET', 'POST'])
def Register():
    if request.method == 'POST':

        Email = request.form['Email']
        Username = request.form['Username']
        Age = request.form['Age']
        Gender = request.form['Gender']


        BirthYear = request.form['BirthYear']
        BirthMonth = request.form['BirthMonth']
        BirthDay = request.form['BirthDay']
        BirthDate =f"{BirthYear}-{BirthMonth}-{BirthDay}"

        Country = request.form['CountryOfBirth']

        MyDB = ConnectDB()
        MyCursor = MyDB.cursor()
        SQL = """
             INSERT INTO user (EmailAddress, Username, Age, Gender, Birthdate, CountryOfBirth)
             VALUES (%s, %s, %s, %s, %s, %s)
            """
        
        Val = (Email, Username, Age, Gender, BirthDate, Country)
        MyCursor.execute(SQL, Val)
        MyDB.commit()

        MyCursor.close()
        MyDB.close()

        session['Email'] = Email
        print("SESSION AFTER REGISTER:", session)


        return redirect(url_for('Dashboard'))
    

    return render_template('Registeration.html')

@App.route('/nominate', methods=['GET', 'POST'])
def Nominate(): 
    if request.method == 'POST': 

        EmAdd = session.get('Email', None)
        print(EmAdd)
        if not EmAdd: 
            return redirect(url_for('NotLoggedIn'))
        
        Cat = request.form['Category']
        Title = request.form['Title']

        RYear = request.form['ReleaseYear']
        RMonth = request.form['ReleaseMonth']
        RDay = request.form['ReleaseDay']
        RDate = f"{RYear}-{RMonth}-{RDay}"

        ItNo = request.form['Iteration']
        Y = request.form["Year"]

        FN = request.form["FName"]
        MN = request.form["MName"]
        LN = request.form["LName"]
        
        try:
            MyDB = ConnectDB()
            MyCursor = MyDB.cursor()
            SQL = """
                INSERT INTO usernomination (EmailAddress, Category, Title, ReleaseDate, IterationNo, Year, FName, MName, LName)
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
                """
            
            Val = (EmAdd, Cat, Title, RDate, ItNo, Y, FN, MN , LN)
            print("Executing nomination insert:", Val)
            MyCursor.execute(SQL, Val)
            MyDB.commit()
            print("✅ Nomination inserted successfully!")
        except Exception as e:
            print("❌ Failed to insert nomination:", e)
        finally:
            MyCursor.close()
            MyDB.close()

        return redirect(url_for('Dashboard'))
    
    return render_template('/NominationByUser.html')


@App.route('/UserNominations')
def UserNominations():
    EmAdd = session.get('Email', None)
    print(EmAdd)
    if not EmAdd: 
         return redirect(url_for('NotLoggedIn'))
    MyDB = ConnectDB()
    MyCursor = MyDB.cursor()
    SQL = """
         SELECT n.Category, n.Title , n.ReleaseDate , n.IterationNo, n.Year, n.FName, n.MName, n.LName
         FROM usernomination n 
         WHERE n.EmailAddress = %s
             
      """
    try:
        MyCursor.execute(SQL, (EmAdd,))
        Nom = MyCursor.fetchall()
    except Exception as e: 
         print("Failed to insert nomination:", e)

    MyCursor.close()
    MyDB.close()

    return render_template('NominationListByUser.html', Nominations = Nom)

@App.route('/TopNomByUsers')
def TopNomByUser(): 
    MyDB = ConnectDB()
    MyCursor = MyDB.cursor()

    SQL = """
          SELECT n.Category, n.Year, n.Title, COUNT(*) AS Nominations
          FROM usernomination n 
          GROUP BY 1,  2 , 3
          ORDER BY 4 DESC 
          LIMIT 10
        """
    MyCursor.execute(SQL)
    Top = MyCursor.fetchall()

    MyCursor.close()
    MyDB.close()

    return render_template('TopNomByUsers.html', Movies = Top)



@App.route('/TopNomRole', methods=['GET', 'POST'])
def TopNomRole():
    try:
        if request.method == 'POST': 
            print("FORM SUBMITTED 🚀")
            Role = request.form['Role']
            FName = request.form['FName']
            MName = request.form['MName']
            LName = request.form['LName']
            print(Role, FName, MName, LName)

            MyDB = ConnectDB()
            MyCursor = MyDB.cursor()

            if MName.strip() == '':  # No Middle Name
                SQL = """
                SELECT w.Role, n.FName, n.MName, n.LName, 
                       COUNT(*) AS TotalNominations, 
                       SUM(CASE WHEN n.IsGranted = 1 THEN 1 ELSE 0 END) AS TotalOscarsWon
                FROM nomination n 
                INNER JOIN worksat w 
                ON n.FName = w.FName 
                   AND n.LName = w.LName 
                   AND n.Title = w.Title 
                   AND n.ReleaseDate = w.ReleaseDate
                WHERE w.Role = %s 
                  AND n.FName = %s 
                  AND n.LName = %s
                  AND (n.MName IS NULL OR n.MName = '')
                GROUP BY 1, 2, 3, 4
                """
                Val = (Role, FName, LName)
            else:  # Has Middle Name
                SQL = """
                SELECT w.Role, n.FName, n.MName, n.LName, 
                       COUNT(*) AS TotalNominations, 
                       SUM(CASE WHEN n.IsGranted = 1 THEN 1 ELSE 0 END) AS TotalOscarsWon
                FROM nomination n 
                INNER JOIN worksat w 
                ON n.FName = w.FName 
                   AND n.MName = w.MName 
                   AND n.LName = w.LName 
                   AND n.Title = w.Title 
                   AND n.ReleaseDate = w.ReleaseDate
                WHERE w.Role = %s 
                  AND n.FName = %s 
                  AND n.MName = %s 
                  AND n.LName = %s
                GROUP BY 1, 2, 3, 4
                """
                Val = (Role, FName, MName, LName)

            MyCursor.execute(SQL, Val)
            Top = MyCursor.fetchone()
            print("QUERY RESULT:", Top)

            MyCursor.close()
            MyDB.close()

            return render_template('TotalNomRole.html', Person=Top)
    except Exception as e: 
           print( "Couldnt execute query" , e)

    return render_template('TotalNomRole.html', Person = None)

@App.route('/BirthCountries')
def BirthCountries(): 
    MyDB = ConnectDB()
    MyCursor = MyDB.cursor()

    SQL = """
        SELECT p.CountryOfBirth, COUNT(*) AS TotalWins
        FROM nomination n
        JOIN person p ON n.FName = p.FName AND n.LName = p.LName
        WHERE n.IsGranted = 1 AND n.Category = 'Best Actor'
        GROUP BY 1
        ORDER BY 2 DESC
        LIMIT 5;
        """
    MyCursor.execute(SQL)
    Top = MyCursor.fetchall()

    MyCursor.close()
    MyDB.close()

    return render_template('BirthCountries.html', Actor = Top)
@App.route('/NomStaff', methods = ['GET', 'POST'])
def NomStaff(): 
    if request.method == 'POST': 
        Country = request.form['Country']

        try:
            MyDB = ConnectDB()
            MyCursor = MyDB.cursor()

            SQL = """
            SELECT n.FName, n.MName, n.LName, n.Category, 
            COUNT(*) AS TotalNominations, 
            SUM(CASE WHEN n.IsGranted = 1 THEN 1 ELSE 0 END) AS TotalOscars
            FROM nomination n
            JOIN person p ON n.FName = p.FName AND n.LName = p.LName
            WHERE p.CountryOfBirth LIKE %s 
            GROUP BY 1, 2, 3, 4
            ORDER BY 5 DESC, 6 DESC;
            """
            MyCursor.execute(SQL, ('%' + Country + '%',))
            Top = MyCursor.fetchall()

            MyCursor.close()
            MyDB.close()
        except Exception as e: 
            print( "Couldnt execute query" , e)

        return render_template('NomStaff.html', Results = Top, Country = Country)
    
    return render_template('NomStaff.html', Results = None)
@App.route('/DreamTeam')
def DreamTeam(): 
    try: 
        MyDB = ConnectDB()
        MyCursor = MyDB.cursor()
        SQL = """
 (
SELECT 'Director' AS Role, p.FName, p.MName, p.LName, COUNT(*) AS Oscars
FROM nomination n
JOIN person p ON n.FName = p.FName AND n.MName <=> p.MName AND n.LName = p.LName
JOIN worksat w ON w.FName = p.FName AND w.MName <=> p.MName AND w.LName = p.LName AND w.Title = n.Title AND w.ReleaseDate = n.ReleaseDate
WHERE n.IsGranted = 1 AND w.Role = 'Director' AND p.DeathDate = '1999-12-12'
GROUP BY p.FName, p.MName, p.LName
ORDER BY Oscars DESC
LIMIT 1
)
UNION ALL
(
SELECT 'Actor' AS Role, p.FName, p.MName, p.LName, COUNT(*) AS Oscars
FROM nomination n
JOIN person p ON n.FName = p.FName AND n.MName <=> p.MName AND n.LName = p.LName
JOIN worksat w ON w.FName = p.FName AND w.MName <=> p.MName AND w.LName = p.LName AND w.Title = n.Title AND w.ReleaseDate = n.ReleaseDate
WHERE n.IsGranted = 1 AND w.Role = 'Actor' AND p.DeathDate = '1999-12-12'
GROUP BY p.FName, p.MName, p.LName
ORDER BY Oscars DESC
LIMIT 1
)
UNION ALL
(
SELECT 'Producer', p.FName, p.MName, p.LName, COUNT(*) AS Oscars
FROM nomination n
JOIN person p ON n.FName = p.FName AND n.MName <=> p.MName AND n.LName = p.LName
JOIN worksat w ON w.FName = p.FName AND w.MName <=> p.MName AND w.LName = p.LName AND w.Title = n.Title AND w.ReleaseDate = n.ReleaseDate
WHERE n.IsGranted = 1 AND w.Role = 'Producer' AND p.DeathDate = '1999-12-12'
GROUP BY p.FName, p.MName, p.LName
ORDER BY COUNT(*) DESC
LIMIT 1
)
UNION ALL
(
SELECT 'Cinematographer', p.FName, p.MName, p.LName, COUNT(*) AS Oscars
FROM nomination n
JOIN person p ON n.FName = p.FName AND n.MName <=> p.MName AND n.LName = p.LName
JOIN worksat w ON w.FName = p.FName AND w.MName <=> p.MName AND w.LName = p.LName AND w.Title = n.Title AND w.ReleaseDate = n.ReleaseDate
WHERE n.IsGranted = 1 AND w.Role = 'Cinematographer' AND p.DeathDate = '1999-12-12'
GROUP BY p.FName, p.MName, p.LName
ORDER BY COUNT(*) DESC
LIMIT 1
)
UNION ALL
(
SELECT 'Composer', p.FName, p.MName, p.LName, COUNT(*) AS Oscars
FROM nomination n
JOIN person p ON n.FName = p.FName AND n.MName <=> p.MName AND n.LName = p.LName
JOIN worksat w ON w.FName = p.FName AND w.MName <=> p.MName AND w.LName = p.LName AND w.Title = n.Title AND w.ReleaseDate = n.ReleaseDate
WHERE n.IsGranted = 1 AND w.Role = 'Composer' AND p.DeathDate = '1999-12-12'
GROUP BY p.FName, p.MName, p.LName
ORDER BY COUNT(*) DESC
LIMIT 1
)
"""
        MyCursor.execute(SQL)
        Team = MyCursor.fetchall()

        MyCursor.close()
        MyDB.close()
        return render_template('DreamTeam.html', Team = Team)
    except Exception as e: 
        print("Couldn't Excute query: ",e)
    
    return render_template('DreamTeam.html', Team = None)

@App.route('/ProdCom')
def ProdCom(): 
    try: 
        MyDB = ConnectDB()
        MyCursor = MyDB.cursor()
        SQL = """
        SELECT mp.ProductionCompany, COUNT(*) AS TotalOscarWins
FROM nomination n
JOIN movieproductioncom mp ON n.Title = mp.Title AND n.ReleaseDate = mp.ReleaseDate
WHERE n.IsGranted = 1
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;
"""
        MyCursor.execute(SQL)
        P = MyCursor.fetchall()

        MyCursor.close()
        MyDB.close()

        return render_template('ProdCom.html', Prod = P)
    
       
    except Exception as e: 
        print("Couldn't Excute query: ",e)
    return render_template('ProdCom.html', Prod = None)
@App.route('/NonEnglish')
def NonEnglish():
    try: 

         
        MyDB = ConnectDB()
        MyCursor = MyDB.cursor()
        SQL = """
        SELECT DISTINCT m.Title, m.ReleaseDate, n.Year, m.Language
FROM nomination n
JOIN movie m ON n.Title = m.Title AND n.ReleaseDate = m.ReleaseDate
WHERE n.IsGranted = 1 
  AND m.Language NOT LIKE '%English%'
  AND m.Language IS NOT NULL
  AND m.Language <> '';
ORDER BY 3 DESC;
  
"""
        MyCursor.execute(SQL)
        Non = MyCursor.fetchall()

        MyCursor.close()
        MyDB.close()

        return render_template('NonEnglish.html', Non = Non)
        
    except Exception as e: 
        print("Couldn't Excute query: ",e)

    return render_template('NonEnglish.html', Non = None)
if __name__ == '__main__': 
    App.run(debug=True)