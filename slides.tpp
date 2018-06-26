--author Casper Thomsen
--title Gemifying Apple Pay
--center A shameless plug


--date 2018-06-25

--newpage already-done
--heading It's already done

--center https://rubygems.org/search?query=apple+pay

name              version downloads
================= ======= =========
gala                0.4.0      3039
apple_pay           0.0.2      1301
pedicel             0.0.4       603
---
pedicel-pay         0.0.2       496
aes256gcm_decrypt   1.0.0       924

--newpage choose-gala
--heading How to choose?

gala:
 - Tests
 - Depends on openssl (gem for <= Ruby 2.3)
 - Spec re. replay attack

https://developer.apple.com/library/archive/documentation/PassKit/Reference/PaymentTokenJSON/PaymentTokenJSON.html

--newpage choose-apple_pay
--heading How to choose?

apple_pay:
 - Complete server side thingy; depends on HTTPClient
 - Depends on ActiveSupport

--newpage choose-pedicel
--heading How to choose?

pedicel:
 - Thin: decryption only
 - Depends on aes256gcm_decrypt, dry-validation
 - Insanely spec'ed
 - Support decryption using (ephemeral) symmetric key

aes256gcm_decrypt:
 - Thin: Ruby -> C -> OpenSSL
 - Support for AES-256-GCM without OpenSSL gem

pedicel-pay:
 - Apple Pay backend: Ruby lib + cli
 - Depends on pedicel, thor, openssl (for <= Ruby 2.3)

--newpage demo
--heading DEMO TIME!

demo-1.sh
demo-2.rb

--newpage validation
--heading dry-validation

Read the friendly source
