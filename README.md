![Header](./png_20230309_191103_0000.png)

# v-hestiacp-sieve
Autolearn spam ham, it has files and dirs, the script moves them to thier place and sets premissions. Cron runs daily adding to athe ll email moved from spam to anywhere but trash as HAM and anything moved to spam as Spam.

## File Descriptions

- `installspam.sh`: Installation script. Sets up directories, permissions, config files, and enables the spamassassin cron job.
- `conf.d/20-spamham.conf`: Dovecot configuration for IMAPSieve and Sieve plugins to trigger spam/ham reporting.
- `mail/sieve/report_spam.sieve`: Sieve script to report messages as spam when moved to the Spam folder.
- `mail/sieve/report_ham.sieve`: Sieve script to report messages as ham when moved out of the Spam folder (except to Trash).
- `sieve/imapsieve_copy`: Bash script called by Sieve to save reported spam/ham emails to disk for later processing.
- `cron.daily/spamham`: Daily cron job script that processes reported spam/ham emails and feeds them to sa-learn for SpamAssassin training.
- `local.cf`: (If present) Local SpamAssassin configuration overrides.

### To Install
-- Clone repo to root
-- Run  cd /root/v-hestiacp-sieve && bash ./installspam.sh
-- Check your /etc/mail/spamassassin/local.cf to the included local.cf to make sure nessisary settings are included.

