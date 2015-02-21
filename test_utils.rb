def random_string(size)
  (0...size).map { (97 + rand(26)).chr }.join
end