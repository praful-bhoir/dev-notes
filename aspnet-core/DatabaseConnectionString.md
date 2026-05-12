# Database Connection String Documentation

# Connection String Configuration

```json
"ConnectionStrings": {
  "DefaultConnection": "Server=ServerName;Database=DBName;User ID=appuser;Password=YourStrongPassword;Encrypt=True;TrustServerCertificate=False;MultipleActiveResultSets=True;Connection Timeout=30;"
}
```

# Recommended Parameter Order Convention
Although SQL Server connection strings do not require a strict parameter order, the following sequence is widely used for readability and maintainability:

1. Server
2. Database
3. Authentication
4. Security
5. Performance / Features
6. Timeout & Additional Settings

Example:
```
Server=ServerName;
Database=DBName;
User ID=appuser;
Password=YourStrongPassword;
Encrypt=True;
TrustServerCertificate=False;
MultipleActiveResultSets=True;
Connection Timeout=30;
```

# Parameter Explanation

| Parameter | Description |
|---|---|
| `Server=ServerName` | Specifies the SQL Server machine name and SQL Server instance name. |
| `Database=DBName` | Defines the target database to connect to. |
| `User ID=appuser` | SQL Server authentication username. |
| `Password=YourStrongPassword` | Password for the SQL Server login. |
| `Encrypt=True` | Enables encrypted communication between the application and SQL Server. |
| `TrustServerCertificate=False` | Forces validation of the SQL Server SSL certificate. |
| `MultipleActiveResultSets=True` | Allows multiple active database operations using the same connection. |
| `Connection Timeout=30` | Maximum wait time (in seconds) before the connection attempt fails. |


# Security Recommendations

## Avoid Hardcoding Passwords

Do not store production passwords directly inside `appsettings.json`.

Recommended alternatives:

- Environment Variables
- Azure Key Vault
- User Secrets (Development)
- Secure Secret Managers

Example using environment variables:

```json
"ConnectionStrings": {
  "DefaultConnection": "Server=ServerName;Database=DBName;User ID=appuser;"
}
```
---

# Example Usage in ASP.NET Core
`Program.cs`
```csharp
// Add services to the container.
var connectionString = builder.Configuration.GetConnectionString("DefaultConnection") ?? throw new InvalidOperationException("Connection string 'DefaultConnection' not found.");

builder.Services.AddDbContext<AppDbContext>(options =>
{
    options.UseSqlServer(connectionString);
});
```

# What Connection Timeout Means
It controls how long the application waits while opening a database connection before throwing an error.

Example error after timeout:

```
A network-related or instance-specific error occurred while establishing a connection to SQL Server.
```

## Common Values
| Environment          | Recommended  |
| -------------------- | ------------ |
| Local development    | Default (15) |
| Production           | 30           |
| Slow network/VPN     | 60           |
| High-performance LAN | 15–30        |


# Notes
- Ensure SQL Server authentication is enabled.
- Verify that the SQL Server instance SQLEXPRESS is running.
- If using SSL encryption, make sure the server certificate is properly configured.
- `TrustServerCertificate=False` is recommended for production environments.
- `MultipleActiveResultSets=True` is useful when executing multiple queries simultaneously using Entity Framework.

# Environment Recommendation
| Environment | Recommended Setting                                        |
| ----------- | ---------------------------------------------------------- |
| Development | `TrustServerCertificate=True` (optional for local testing) |
| Production  | `TrustServerCertificate=False`                             |
| Production  | Use secure secret storage for passwords                    |
| Production  | Enable `Encrypt=True`                                      |

# Sample Production-Ready Connection String

```
Server=PROD-SQL01;
Database=LiveDBName;
User ID=appuser;
Password=<SecurePassword>;
Encrypt=True;
TrustServerCertificate=False;
MultipleActiveResultSets=True;
Connection Timeout=30;
```