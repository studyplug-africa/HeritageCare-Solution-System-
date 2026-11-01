using System;
using System.Data.SqlClient;

namespace HeritageCare_Solution.backend
{
    // class that handles user login logic
    public class login_user
    {
        // connection string to the Heritage_system database on LocalDB
        private string connectionString = @"Server=(localdb)\MSSQLLocalDB;Database=Heritage_system;Integrated Security=True;";

        // method that checks the login details against the database
        public loginResult ValidateLogin(string email, string password)
        {
            // result object that will be returned
            loginResult result = new loginResult();

            // check if either field is empty
            if (string.IsNullOrWhiteSpace(email) || string.IsNullOrWhiteSpace(password))
            {
                result.Success = false;
                result.Message = "Please enter your email and password.";
                return result;
            } // end of if block for empty fields

            // open a connection to the database
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // sql command that looks for the user with the given email and password
                SqlCommand command = new SqlCommand("SELECT UserId, FullName FROM dbo.Users WHERE Email = @Email AND Password = @Password", connection);
                command.Parameters.AddWithValue("@Email", email.Trim());
                command.Parameters.AddWithValue("@Password", password);

                // read the matching row
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    // if no row was found return an error
                    if (!reader.Read())
                    {
                        result.Success = false;
                        result.Message = "Invalid email or password.";
                        return result;
                    } // end of if block for no match

                    // fill the result with the user details
                    result.Success = true;
                    result.Message = "Login successful.";
                    result.UserId = Convert.ToInt32(reader["UserId"]);
                    result.FullName = reader["FullName"].ToString();
                } // end of using block for reader


            } // end of using block for connection


            return result;
        } // end of ValidateLogin method


    } // end of login_user class



    // class that holds the result of a login attempt
    public class loginResult
    {
        public bool Success { get; set; }
        public string Message { get; set; }
        public int UserId { get; set; }
        public string FullName { get; set; }
    } // end of loginResult class


} // end of HeritageCare_Solution.backend namespace