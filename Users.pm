package Users;

BEGIN { }

@table=();

sub AddUser (%){
	my %user = @_;
	#print $user{'name'}."\n";
	push (@table, \%user);
}
sub EditUserById ($){#Id

}
sub SaveUsers($){#File path

}
sub OpenUsers($){#File path
#	г) загрузить данные о пользователе в массив пакета.
	my $filename = shift;
	if(open(my $TABLEFILE, "<:encoding(UTF-8)", "$filename")){
		@table=();
		while(my $line=<$TABLEFILE>){
			chomp $line;
			my @data = split "\t", $line;
			%user = (
				'id' => $data[0],
				'name' => $data[1],
				'email' => $data[2],
				'age' => $data[3],
				'status' => $data[4],
			);
			AddUser(%user);
		}
		$tablename = $filename;
		close($TABLEFILE);
		print "Таблица $filename загружена;\n";
	}else{
		print "Не удалось загрузить '$filename' $!";
	}
	
}

return 1;

END { }

#1. Пакет Users реализуйте в модуле Users.pm. 
#В пакете должен быть определен массив хешей -- массив записей о пользователях. Каждый элемент массива -- это хеш с ключами: 
	#id, 
	#name, 
	#email, 
	#age, 
	#status. 
#В   модуле реализуйте процедуры:
#	а) добавить информацию о новом пользователе в массив;
#	б) обновить данные о пользователе с данным значением  ключа id;
#	в) сохранить данные о пользователях в файл;
#Экспортируйте все процедуры из этого модуля.
