using System;
using System.Data.SqlClient;

namespace HeritageCare_Solution.backend
{
    // class that handles user registration logic
    public class register_user
    {
        // connection string to the Heritage_system database on LocalDB
        private string connectionString = @"Server=(localdb)\MSSQLLocalDB;Database=Heritage_system;Integrated Security=True;";

        // method that validates the input and adds the new user to the database
        public registerResult Register(string fullName, string email, string password, string contactNumber)
        {
            // result object that will be returned
            registerResult result = new registerResult();

            // check if any field is empty
            if (string.IsNullOrWhiteSpace(fullName) || string.IsNullOrWhiteSpace(email) || string.IsNullOrWhiteSpace(password) || string.IsNullOrWhiteSpace(contactNumber))
            {
                result.Success = false;
                result.Message = "Please fill in all fields.";
                return result;
            } // end of if block for empty fields

            // open a connection to the database
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // check if the email is already registered
                SqlCommand checkCommand = new SqlCommand("SELECT COUNT(*) FROM dbo.Users WHERE Email = @Email", connection);
                checkCommand.Parameters.AddWithValue("@Email", email.Trim());
                int emailCount = (int)checkCommand.ExecuteScalar();

                // if the email already exists return an error
                if (emailCount > 0)
                {
                    result.Success = false;
                    result.Message = "That email address is already registered.";
                    return result;
                } // end of if block for duplicate email

                // insert the new user into the database
                SqlCommand insertCommand = new SqlCommand("INSERT INTO dbo.Users (FullName, Email, Password, ContactNumber) VALUES (@FullName, @Email, @Password, @ContactNumber)", connection);
                insertCommand.Parameters.AddWithValue("@FullName", fullName.Trim());
                insertCommand.Parameters.AddWithValue("@Email", email.Trim());
                insertCommand.Parameters.AddWithValue("@Password", password);
                insertCommand.Parameters.AddWithValue("@ContactNumber", contactNumber.Trim());
                insertCommand.ExecuteNonQuery();
            } // end of using block for connection

            // return success
            result.Success = true;
            result.Message = "Registration successful. You can now log in.";
            return result;
        } // end of Register method



    } // end of register_user class




    // class that holds the result of a registration attempt
    public class registerResult
    {
        public bool Success { get; set; }
        public string Message { get; set; }
    } // end of registerResult class



} // end of HeritageCare_Solution.backend namespace