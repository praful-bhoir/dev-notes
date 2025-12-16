# Configure Authenticator App in ASP.NET Core (Developer Guide)
## 1. Overview
This guide explains how developers can implement Two-Factor Authentication (2FA) using an Authenticator App (TOTP) in an ASP.NET Core application using Identity, including required services, pages, and code flow.

## 2. Configure Identity Services
`Program.cs`
```csharp
builder.Services.AddDefaultIdentity<IdentityUser>(options =>
{
    options.SignIn.RequireConfirmedAccount = true;

    options.Tokens.AuthenticatorTokenProvider = 
        TokenOptions.DefaultAuthenticatorProvider;

    options.Lockout.AllowedForNewUsers = true;
})
.AddEntityFrameworkStores<ApplicationDbContext>();
```

## 3. Generate QR Code for Authenticator App
The QR code is generated on the client side using qrcodejs and contains the AuthenticatorUri provided by the backend.
`EnableAuthenticator.cshtml`
```javascript
<script src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>
<script>
    new QRCode(document.getElementById("qrCode"), {
        text: "@Model.AuthenticatorUri",
        width: 200,
        height: 200
    });
</script>
```