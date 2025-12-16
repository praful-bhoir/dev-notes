DECLARE @i INT = 1000;

WHILE @i <= 10000
BEGIN
    INSERT INTO AspNetUsers (
        Id,
        Discriminator,
        FirstName,
        LastName,
        UserName,
        NormalizedUserName,
        Email,
        NormalizedEmail,
        EmailConfirmed,
        PhoneNumber,
        PhoneNumberConfirmed,
        TwoFactorEnabled,
        IsActive,
        CreatedAt,
        UpdatedAt,
        SecurityStamp,
        ConcurrencyStamp,
        PasswordHash,
        LockoutEnabled,
        AccessFailedCount,
        AllowMultipleSessions
    )
    VALUES (
        NEWID(),                                  -- Id
        'ApplicationUser',                        -- Discriminator
        CONCAT('First', @i),                      -- FirstName
        CONCAT('Last', @i),                       -- LastName
        CONCAT('user', @i, '@test.com'),          -- UserName
        UPPER(CONCAT('user', @i, '@test.com')),   -- NormalizedUserName
        CONCAT('user', @i, '@test.com'),          -- Email
        UPPER(CONCAT('user', @i, '@test.com')),   -- NormalizedEmail
        1,                                        -- EmailConfirmed
        NULL,                                     -- PhoneNumber
        0,                                        -- PhoneNumberConfirmed (NOT NULL)
        0,                                        -- TwoFactorEnabled (NOT NULL)
        1,                                        -- IsActive
        GETDATE(),                                -- CreatedAt
        GETDATE(),                                -- UpdatedAt
        NEWID(),                                  -- SecurityStamp
        NEWID(),                                  -- ConcurrencyStamp
        'AQAAAAIAAYagAAAAEIE9b5z9llUd8wLatjp64FQ+P6Z77fEh5Hpzn6G+hBdDpHaSpBM7wsBHUJmddvTLRA==',
        1,                                        -- LockoutEnabled
        0,                                        -- AccessFailedCount
        0                                         -- AllowMultipleSessions
    );

    SET @i += 1;
END;
