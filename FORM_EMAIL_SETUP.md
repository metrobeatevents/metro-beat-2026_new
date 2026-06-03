# Netlify Forms Email Configuration

## Automatic Email Notifications to Form Submitters

### Configuration Added

Added Netlify Forms email plugin to `netlify.toml` to automatically send confirmation emails to people who submit the quote form.

### How It Works

1. **User submits quote form** at `/quote`
2. **Netlify receives submission** with user's email address
3. **Automatic confirmation email** sent to the email address they provided
4. **User receives confirmation** that their quote request was received
5. **You receive notification** in Netlify dashboard and via email (if configured)

### Email Configuration in netlify.toml

```toml
[[plugins]]
  package = "@netlify/plugin-emails"

[plugins.inputs]
  autoresponder = true
```

### Additional Setup Required in Netlify Dashboard

After deploying, you need to configure email settings in Netlify:

1. **Go to Netlify Dashboard**
   - Navigate to your site
   - Click "Forms" in the left sidebar

2. **Configure Form Notifications**
   - Click on the "quote" form
   - Go to "Form notifications" settings
   - Click "Add notification"

3. **Set Up Email to Submitter**
   - Choose "Email notification"
   - **To email:** Use `{{email}}` (this pulls from the form field)
   - **From email:** `noreply@metrobeatevents.com` (or your verified email)
   - **Subject:** "Thank you for your quote request - Metro Beat Events"
   - **Email body template:**

```
Hi {{name}},

Thank you for requesting a quote from Metro Beat Events!

We've received your request for:
Event Date: {{eventDate}}
Event Type: {{eventType}}
Venue: {{venue}}

Our team will review your request and get back to you within 24 hours with a personalized quote.

In the meantime, feel free to:
- Browse our packages: https://www.metrobeatevents.com/packages
- View our gallery: https://www.metrobeatevents.com/gallery
- Learn more about our services: https://www.metrobeatevents.com/services

Questions? Reply to this email or call us at (703) XXX-XXXX

Best regards,
Metro Beat Events Team
https://www.metrobeatevents.com

---
This is an automated confirmation. Please do not reply to this email.
```

4. **Set Up Email to You (Business Owner)**
   - Click "Add notification" again
   - Choose "Email notification"
   - **To email:** Your business email address
   - **Subject:** "New Quote Request - {{name}}"
   - **Email body:** Include all form fields for your reference

### Form Fields Available for Email Templates

From the quote form, you can use these variables in email templates:

- `{{name}}` - Full name
- `{{email}}` - Email address
- `{{phone}}` - Phone number
- `{{eventDate}}` - Event date
- `{{eventType}}` - Type of event
- `{{venue}}` - Venue name
- `{{guestCount}}` - Number of guests
- `{{services}}` - Selected services (DJ, Photography, Lighting)
- `{{addons}}` - Selected add-ons
- `{{budget}}` - Budget range
- `{{message}}` - Additional message

### Alternative: Zapier Integration

If you want more advanced email customization:

1. **Connect Netlify Forms to Zapier**
   - Go to Netlify Forms settings
   - Enable Zapier integration
   - Create Zap: Netlify Forms → Gmail/Email

2. **Benefits:**
   - Custom HTML email templates
   - Send from your business Gmail
   - Add to CRM automatically
   - Send multiple follow-up emails

### Testing Email Notifications

1. **Deploy the changes** (already done)
2. **Submit test form** at `https://www.metrobeatevents.com/quote`
3. **Check your email** (the one you entered in the form)
4. **Verify confirmation email** was received
5. **Check Netlify dashboard** for submission record

### Troubleshooting

**If emails aren't being sent:**

1. **Check Netlify Forms dashboard**
   - Verify form submissions are being received
   - Check spam folder for notifications

2. **Verify email configuration**
   - Make sure `{{email}}` field name matches form field
   - Confirm "From" email is verified in Netlify

3. **Check form field names**
   - Form field: `<input name="email">`
   - Email template: `{{email}}`
   - Names must match exactly

4. **Enable form notifications**
   - Netlify Forms → Settings → Notifications
   - Make sure notifications are enabled

### Important Notes

- **Netlify Forms is free** for up to 100 submissions/month
- **Email notifications** require Netlify Pro plan ($19/mo) OR use Zapier free tier
- **Alternative:** Use a third-party email service like SendGrid, Mailgun, or EmailJS
- **Spam prevention:** Honeypot field already configured in form

### Current Form Configuration

The quote form already has:
- ✅ `data-netlify="true"` - Enables Netlify Forms
- ✅ `name="quote"` - Form identifier
- ✅ `netlify-honeypot="bot-field"` - Spam prevention
- ✅ `action="/thank-you.html"` - Redirect after submission
- ✅ Email field: `<input name="email">` - For sending confirmation

### Next Steps

1. ✅ Deploy changes (done)
2. ⏳ Configure email notifications in Netlify dashboard
3. ⏳ Test form submission
4. ⏳ Verify emails are received
5. ⏳ Customize email templates as needed

---

## Alternative: Free Email Solution with EmailJS

If you don't have Netlify Pro, you can use EmailJS for free:

### EmailJS Setup (Free Alternative)

1. **Sign up at emailjs.com** (free tier: 200 emails/month)
2. **Create email service** (Gmail, Outlook, etc.)
3. **Create email template**
4. **Add EmailJS to quote form**

### Code to Add to quote.html

```html
<!-- Add before closing </body> tag -->
<script src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
<script>
  emailjs.init("YOUR_PUBLIC_KEY");
  
  document.getElementById('quoteForm').addEventListener('submit', function(event) {
    event.preventDefault();
    
    // Send to EmailJS
    emailjs.sendForm('YOUR_SERVICE_ID', 'YOUR_TEMPLATE_ID', this)
      .then(function() {
        // Redirect to thank you page
        window.location.href = '/thank-you.html';
      }, function(error) {
        console.log('Failed...', error);
        alert('Failed to send. Please try again.');
      });
  });
</script>
```

This would send emails without requiring Netlify Pro.

Let me know which approach you prefer!
