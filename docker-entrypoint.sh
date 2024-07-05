#!/usr/bin/env ash

echo
echo "--------------"
echo
echo "Trying to migrate using 'pnpm run payload migrate'"
echo
pnpm run payload migrate

echo
echo "--------------"
echo
echo "Trying to migrate using 'node scripts/migrate.js'"
echo
node scripts/migrate.js

# In a production scenario this would also contain
# pnpm run start
