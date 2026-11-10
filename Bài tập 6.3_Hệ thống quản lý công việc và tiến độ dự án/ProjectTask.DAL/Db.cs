using Microsoft.Data.SqlClient;
namespace ProjectTask.DAL;
public static class Db { public static string ConnectionString {get;set;} = @"Server=(localdb)\MSSQLLocalDB;Database=ProjectTaskDB;Integrated Security=True;TrustServerCertificate=True;"; public static SqlConnection CreateConnection()=>new(ConnectionString); public static async Task TestConnectionAsync(){await using var c=CreateConnection();await c.OpenAsync();} }
