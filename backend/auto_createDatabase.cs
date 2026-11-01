using System;
using System.Data.SqlClient;

namespace HeritageCare_Solution.backend
{
    // class that handles automatic database and table creation
    public class auto_createDatabase
    {
        // connection string to the master database on LocalDB
        private string masterConnectionString = @"Server=(localdb)\MSSQLLocalDB;Integrated Security=True;";

        // connection string to the Heritage_system database on LocalDB
        private string applicationConnectionString = @"Server=(localdb)\MSSQLLocalDB;Database=Heritage_system;Integrated Security=True;";

        // main method that creates the database and then the tables
        public void Create()
        {
            CreateDatabase();
            CreateTables();
        } // end of Create method




        // method that creates the Heritage_system database if it does not exist
        private void CreateDatabase()
        {
            // open a connection to the master database
            using (SqlConnection connection = new SqlConnection(masterConnectionString))
            {
                connection.Open();

                // sql command that checks if the database exists and creates it if not
                SqlCommand command = new SqlCommand("IF DB_ID('Heritage_system') IS NULL BEGIN CREATE DATABASE Heritage_system; END", connection);

                // execute the command
                command.ExecuteNonQuery();
            } // end of using block for connection


        } // end of CreateDatabase method



        // method that creates the Users and HeritageSites tables if they do not exist
        private void CreateTables()
        {
            // open a connection to the Heritage_system database
            using (SqlConnection connection = new SqlConnection(applicationConnectionString))
            {
                connection.Open();

                // sql script that creates the Users table if it does not exist
                string usersTable = "IF OBJECT_ID('dbo.Users', 'U') IS NULL BEGIN CREATE TABLE dbo.Users (UserId INT IDENTITY(1,1) PRIMARY KEY, FullName NVARCHAR(100) NOT NULL, Email NVARCHAR(150) NOT NULL UNIQUE, Password NVARCHAR(200) NOT NULL, ContactNumber NVARCHAR(20) NOT NULL, CreatedAt DATETIME NOT NULL DEFAULT GETDATE()); END";

                // sql script that creates the HeritageSites table if it does not exist
                string heritageSitesTable = "IF OBJECT_ID('dbo.HeritageSites', 'U') IS NULL BEGIN CREATE TABLE dbo.HeritageSites (SiteId INT IDENTITY(1,1) PRIMARY KEY, UserId INT NOT NULL, SiteName NVARCHAR(150) NOT NULL, Location NVARCHAR(200) NOT NULL, Condition NVARCHAR(50) NOT NULL, Description NVARCHAR(500) NULL, CreatedAt DATETIME NOT NULL DEFAULT GETDATE(), CONSTRAINT FK_HeritageSites_Users FOREIGN KEY (UserId) REFERENCES dbo.Users(UserId)); END";

                // create the Users table
                using (SqlCommand command = new SqlCommand(usersTable, connection))
                {
                    command.ExecuteNonQuery();
                } // end of using block for users table command

                // create the HeritageSites table
                using (SqlCommand command = new SqlCommand(heritageSitesTable, connection))
                {
                    command.ExecuteNonQuery();
                } // end of using block for heritage sites table command


            } // end of using block for connection


        } // end of CreateTables method


    } // end of auto_createDatabase class

} // end of HeritageCare_Solution.backend namespace