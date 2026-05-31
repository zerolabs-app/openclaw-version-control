# OpenClaw Email Setup

OpenClaw uses secure SMTP email delivery for task results, cron job reports, and feedback files.

Most users should create a dedicated email account for OpenClaw rather than using their primary personal email.

Supported providers:

* Gmail
* Outlook / Hotmail
* Yahoo Mail
* Zoho Mail
* Custom SMTP

---

## Gmail

Official Instructions:

https://support.google.com/mail/answer/185833?hl=en

Pros

* Recommended for most users
* Reliable App Password support
* Works well with OpenClaw

Setup

1. Enable Two-Factor Authentication on your Google account
2. Generate a Gmail App Password
3. Open OpenClaw Installer
4. Enter your Gmail address
5. Select Gmail as provider
6. Paste the Gmail App Password
7. Save Email Settings
8. Verify the test email is received

Important

Do NOT use your normal Gmail password.

Use a Gmail App Password only.

---

## Outlook / Hotmail

Official Instructions:

https://account.microsoft.com/security

Pros

* Widely used
* Reliable Microsoft infrastructure
* Good alternative to Gmail

Setup

1. Enable Two-Factor Authentication
2. Create an App Password if required by your account
3. Enter your Outlook or Hotmail email address
4. Select Outlook as provider
5. Enter the App Password
6. Save Email Settings
7. Verify the test email is received

---

## Yahoo Mail

Official Instructions:

https://login.yahoo.com/account/security

Pros

* Supports SMTP access
* Supports App Passwords on eligible accounts

Cons

* App Password availability may vary by account
* Newly created Yahoo accounts may not immediately be eligible
* Some users may need to wait 24–72 hours after enabling Two-Factor Authentication

Setup

1. Enable Two-Factor Authentication
2. Generate a Yahoo App Password
3. Enter your Yahoo email address
4. Select Yahoo as provider
5. Paste the App Password
6. Save Email Settings
7. Verify the test email is received

Note

If the Create App Password button is disabled, this is usually a Yahoo account restriction and not an OpenClaw issue.

---

## Zoho Mail

Official Instructions:

https://www.zoho.com/mail/help/adminconsole/two-factor-authentication.html

Pros

* Popular business email provider
* Reliable SMTP service
* Supports App Passwords

Setup

1. Enable Two-Factor Authentication
2. Generate an App Password
3. Enter your Zoho email address
4. Select Zoho as provider
5. Enter the App Password
6. Save Email Settings
7. Verify the test email is received

---

## Custom SMTP

Advanced users may connect OpenClaw to:

* Business email servers
* Self-hosted mail servers
* Third-party SMTP services

Required Information

* SMTP Host
* SMTP Port
* Secure (Yes/No)
* Username
* Password

Examples include:

* Fastmail
* Proton Mail Bridge
* Mailgun
* Amazon SES
* Other SMTP-compatible providers

---

## Testing Email Delivery

OpenClaw automatically sends a test email when Email Settings are saved.

Expected Flow

Save Email Settings

↓

Saving...

↓

Testing Email...

↓

✓ Email Verified

If the test fails, OpenClaw will display the SMTP error so you can correct the settings immediately.

---

## Security Recommendation

For best security:

* Create a dedicated email account for OpenClaw
* Use Two-Factor Authentication
* Use App Passwords when available
* Do not reuse your primary email password
* Rotate App Passwords periodically
