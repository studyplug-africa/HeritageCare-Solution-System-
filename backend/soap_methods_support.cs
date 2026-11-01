using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace HeritageCare_Solution.backend
{
    // normal class that holds the four heritage site operations
    public class soap_methods_support
    {
        // connection string to the Heritage_system database on LocalDB
        private string connectionString = @"Server=(localdb)\MSSQLLocalDB;Database=Heritage_system;Integrated Security=True;";



        // method that returns all heritage sites
        public List<Site> ViewSites()
        {
            List<Site> sites = new List<Site>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("SELECT SiteId, UserId, SiteName, Location, Condition, Description, CreatedAt FROM dbo.HeritageSites", connection);

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Site site = new Site();
                        site.SiteId = Convert.ToInt32(reader["SiteId"]);
                        site.UserId = Convert.ToInt32(reader["UserId"]);
                        site.SiteName = reader["SiteName"].ToString();
                        site.Location = reader["Location"].ToString();
                        site.Condition = reader["Condition"].ToString();
                        site.Description = reader["Description"].ToString();
                        site.CreatedAt = Convert.ToDateTime(reader["CreatedAt"]);
                        sites.Add(site);
                    } // end of while loop
                } // end of using block for reader
            } // end of using block for connection

            return sites;
        } // end of ViewSites method




        // method that adds a new heritage site
        public string AddSite(int userId, string siteName, string location, string condition, string description)
        {
            // check if the required fields are filled
            if (string.IsNullOrWhiteSpace(siteName) || string.IsNullOrWhiteSpace(location) || string.IsNullOrWhiteSpace(condition))
            {
                return "Please fill in all required fields.";
            } // end of if block for empty fields

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("INSERT INTO dbo.HeritageSites (UserId, SiteName, Location, Condition, Description) VALUES (@UserId, @SiteName, @Location, @Condition, @Description)", connection);
                command.Parameters.AddWithValue("@UserId", userId);
                command.Parameters.AddWithValue("@SiteName", siteName.Trim());
                command.Parameters.AddWithValue("@Location", location.Trim());
                command.Parameters.AddWithValue("@Condition", condition.Trim());
                command.Parameters.AddWithValue("@Description", description ?? "");
                command.ExecuteNonQuery();
            } // end of using block for connection

            return "Site added successfully.";
        } // end of AddSite method



        // method that deletes a heritage site by its id
        public string DeleteSite(int siteId)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("DELETE FROM dbo.HeritageSites WHERE SiteId = @SiteId", connection);
                command.Parameters.AddWithValue("@SiteId", siteId);
                int rows = command.ExecuteNonQuery();

                // if no rows were affected the site was not found
                if (rows == 0)
                {
                    return "Site not found.";
                } // end of if block for no rows
            } // end of using block for connection

            return "Site deleted successfully.";
        } // end of DeleteSite method



        // method that returns sites filtered by condition
        public List<Site> FilterSitesByCondition(string condition)
        {
            List<Site> sites = new List<Site>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("SELECT SiteId, UserId, SiteName, Location, Condition, Description, CreatedAt FROM dbo.HeritageSites WHERE Condition = @Condition", connection);
                command.Parameters.AddWithValue("@Condition", condition.Trim());

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Site site = new Site();
                        site.SiteId = Convert.ToInt32(reader["SiteId"]);
                        site.UserId = Convert.ToInt32(reader["UserId"]);
                        site.SiteName = reader["SiteName"].ToString();
                        site.Location = reader["Location"].ToString();
                        site.Condition = reader["Condition"].ToString();
                        site.Description = reader["Description"].ToString();
                        site.CreatedAt = Convert.ToDateTime(reader["CreatedAt"]);
                        sites.Add(site);
                    } // end of while loop
                } // end of using block for reader
            } // end of using block for connection

            return sites;
        } // end of FilterSitesByCondition method


        // method that updates an existing heritage site
        public string UpdateSite(int siteId, string siteName, string location, string condition, string description)
        {
            // check if the required fields are filled
            if (string.IsNullOrWhiteSpace(siteName) || string.IsNullOrWhiteSpace(location) || string.IsNullOrWhiteSpace(condition))
            {
                return "Please fill in all required fields.";
            } // end of if block for empty fields

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("UPDATE dbo.HeritageSites SET SiteName = @SiteName, Location = @Location, Condition = @Condition, Description = @Description WHERE SiteId = @SiteId", connection);
                command.Parameters.AddWithValue("@SiteId", siteId);
                command.Parameters.AddWithValue("@SiteName", siteName.Trim());
                command.Parameters.AddWithValue("@Location", location.Trim());
                command.Parameters.AddWithValue("@Condition", condition.Trim());
                command.Parameters.AddWithValue("@Description", description ?? "");
                int rows = command.ExecuteNonQuery();

                if (rows == 0)
                {
                    return "Site not found.";
                } // end of if block for no rows
            } // end of using block for connection

            return "Site updated successfully.";
        } // end of UpdateSite method




        // method that returns a single user's details
        public User GetUser(int userId)
        {
            User user = null;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("SELECT UserId, FullName, Email, ContactNumber, CreatedAt FROM dbo.Users WHERE UserId = @UserId", connection);
                command.Parameters.AddWithValue("@UserId", userId);

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        user = new User();
                        user.UserId = Convert.ToInt32(reader["UserId"]);
                        user.FullName = reader["FullName"].ToString();
                        user.Email = reader["Email"].ToString();
                        user.ContactNumber = reader["ContactNumber"].ToString();
                        user.CreatedAt = Convert.ToDateTime(reader["CreatedAt"]);
                    } // end of if block for found row
                } // end of using block for reader
            } // end of using block for connection

            return user;
        } // end of GetUser method

        // method that updates a user's profile
        public string UpdateProfile(int userId, string fullName, string contactNumber)
        {
            if (string.IsNullOrWhiteSpace(fullName) || string.IsNullOrWhiteSpace(contactNumber))
            {
                return "Please fill in all fields.";
            } // end of if block for empty fields

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("UPDATE dbo.Users SET FullName = @FullName, ContactNumber = @ContactNumber WHERE UserId = @UserId", connection);
                command.Parameters.AddWithValue("@UserId", userId);
                command.Parameters.AddWithValue("@FullName", fullName.Trim());
                command.Parameters.AddWithValue("@ContactNumber", contactNumber.Trim());
                command.ExecuteNonQuery();
            } // end of using block for connection

            return "Profile updated successfully.";
        } // end of UpdateProfile method

        // method that changes the user's password
        public string ChangePassword(int userId, string currentPassword, string newPassword)
        {
            if (string.IsNullOrWhiteSpace(currentPassword) || string.IsNullOrWhiteSpace(newPassword))
            {
                return "Please fill in both password fields.";
            } // end of if block for empty fields

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand check = new SqlCommand("SELECT COUNT(*) FROM dbo.Users WHERE UserId = @UserId AND Password = @Password", connection);
                check.Parameters.AddWithValue("@UserId", userId);
                check.Parameters.AddWithValue("@Password", currentPassword);
                int matchCount = (int)check.ExecuteScalar();

                if (matchCount == 0)
                {
                    return "Current password is incorrect.";
                } // end of if block for wrong password

                SqlCommand update = new SqlCommand("UPDATE dbo.Users SET Password = @Password WHERE UserId = @UserId", connection);
                update.Parameters.AddWithValue("@UserId", userId);
                update.Parameters.AddWithValue("@Password", newPassword);
                update.ExecuteNonQuery();
            } // end of using block for connection

            return "Password changed successfully.";
        } // end of ChangePassword method







    } // end of soap_method class


    // class that represents a heritage site
    public class Site
    {
        public int SiteId { get; set; }
        public int UserId { get; set; }
        public string SiteName { get; set; }
        public string Location { get; set; }
        public string Condition { get; set; }
        public string Description { get; set; }
        public DateTime CreatedAt { get; set; }
    } // end of Site class


    // class that represents a user
    public class User
    {
        public int UserId { get; set; }
        public string FullName { get; set; }
        public string Email { get; set; }
        public string ContactNumber { get; set; }
        public DateTime CreatedAt { get; set; }
    } // end of User class



} // end of HeritageCare_Solution.backend namespace