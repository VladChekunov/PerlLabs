$word = <>;
chomp $word;

print join "\_",split(//, $word);
