#Вариант 1 (18 номер).
use feature qw(switch);
use Term::ANSIColor;
use utf8;
binmode(STDOUT,':utf8');

use Data::Dumper;
use Encode;

@table=();
$tablename = "";

#decode('iso-8859-1', "Иван");

sub selectTable {
	print "Введите номер колонки, относительно которой требуется осуществлять поиск: ";
	$col = <>;
	chomp $col;
	if($col eq "1"){
		$colum="number";
	}
	if($col eq "2"){
		$colum="name";
	}
	if($col eq "3"){
		$colum="adress";
	}
	if($col eq "4"){
		$colum="date";
	}
	if($col eq "5"){
		$colum="facul";
	}
	if($col eq "6"){
		$colum="group";
	}
	if($col eq "7"){
		$colum="isstar";
	}
	if($col eq "8"){
		$colum="reward";
	}
	print "Введите часть запроса для поиска: ";
	$searchword = <>;
	chomp $searchword;

		print "No.\t";
		print "Студенческий\t";
		print "ФИО\t\t\t";
		print "Адрес\t\t\t\t";
		print "Зачислен\t";
		print "Фак.\t";
		print "Группа\t";
		print "Староста\t";
		print "Степендия\t";
		print "\n";

		$num = 0;
		foreach my $raw (@table){
			$num++;
			if(index($$raw{$colum}, Encode::decode('UTF-8', $searchword)) != -1){
				print "$num\t";
				print "$$raw{'number'}\t";
				print "$$raw{'name'}\t";
				print "$$raw{'adress'}\t";
				print "$$raw{'date'}\t";
				print "$$raw{'facul'}\t";
				print "$$raw{'group'}\t";
				if($$raw{'isstar'} eq "true"){
					printf "Да";
				}else{
					printf "Нет";
				}
				print "\t\t";
				print "$$raw{'reward'}\n";
			}
		}
	#TODO	
}

sub sortTable {
	print "Введите номер колонки, относительно которой требуется осуществлять сортировку: ";
	$col = <>;
	chomp $col;
	if($col eq "1"){
		$colum="number";
	}
	if($col eq "2"){
		$colum="name";
	}
	if($col eq "3"){
		$colum="adress";
	}
	if($col eq "4"){
		$colum="date";
	}
	if($col eq "5"){
		$colum="facul";
	}
	if($col eq "6"){
		$colum="group";
	}
	if($col eq "7"){
		$colum="isstar";
	}
	if($col eq "8"){
		$colum="reward";
	}
	
	my @sorted =  sort { $a->{$colum} <=> $b->{$colum} } @table;
	print join "\n", map {$_->{number}."\t".$_->{name}."\t".$_->{adress}."\t".$_->{date}."\t".$_->{facul}."\t".$_->{group}."\t".$_->{isstar}."\t".$_->{reward}} @sorted;
}

sub addRaw {
	while($number eq undef || $number !~ /^[0-9]{0,99}+$/){	
		print "Введите номер зачётной книжки: ";
		$number = <>;
		chomp $number;
		if($number !~ /^[0-9]{0,99}+$/){
			print "Номер не валиден. Попробуйте снова.";
		}
		print "\n";
	}
	while($name eq undef){
		print "Введите ФИО: ";
		$name = <>;
		chomp $name;
		print "\n";
	}
	while($adresss eq undef){
		print "Введите Адрес: ";
		$adresss = <>;
		chomp $adresss;
		print "\n";
	}
	while($date eq undef){
		print "Введите дату зачисления: ";
		$date = <>;
		chomp $date;
		print "\n";
	}
	while($facul eq undef){
		print "Введите факультет: ";
		$facul = <>;
		chomp $facul;
		print "\n";
	}
	while($group eq undef){
		print "Введите группу: ";
		$group = <>;
		chomp $group;
		print "\n";
	}
	while($isstar eq undef){
		print "Является ли старостой (y/n): ";
		$isstar = <>;
		chomp $isstar;
		if($isstar eq "y"){
			$isstar="true";
		}else{
			$isstar="false";
		}
		print "\n";
	}
	while($reward eq undef){
		print "Введите степендию: ";
		$reward = <>;
		chomp $reward;
		print "\n";
	}
	addRawFromString("$number\t$name\t$adresss\t$date\t$facul\t$group\t$isstar\t$reward")
}

sub remRaw{
	my $num;
	while($num>($#table+1) || $num<0 || $num eq undef){
		print "Введите номер ячейки, которую необходимо удалить: ";
		$num = <>;
		chomp $num;
		if($num<($#table+1) || $num>0){
			print "Не удалось удалить ячейку $num. Попробуйте снова.\n";
		}
	}
	print "Ячейка $num успешно удалена.\n";
	splice (@table, ($num-1), 1);
}
sub saveTable{
	my $filenameforwrite;#="savetest.txt";
	if($tablename ne undef){
		print "Использовать $tablename для сохранения таблицы? (y/n)";
		my $isuse = <>;
		chomp $isuse;
		if($isuse eq "y"){
			$filenameforwrite = $tablename;
		}
	}
	if($filenameforwrite eq undef){
		print "Введите имя файла для сохранения таблицы: ";
		$filenameforwrite = <>;
		chomp $filenameforwrite;
	}
	open(my $TABLEFILE, ">:encoding(UTF-8)", "$filenameforwrite");
	print $TABLEFILE "номер_студенческого\tФИО\tадрес\tдата_зачисления\tфакультет\tгруппа\tявляется ли старостой\tстипендия\n";
		foreach my $raw (@table){
			print $TABLEFILE "$$raw{'number'}\t";
			print $TABLEFILE "$$raw{'name'}\t";
			print $TABLEFILE "$$raw{'adress'}\t";
			print $TABLEFILE "$$raw{'date'}\t";
			print $TABLEFILE "$$raw{'facul'}\t";
			print $TABLEFILE "$$raw{'group'}\t";
			print $TABLEFILE "$$raw{'isstar'}\t";
			print $TABLEFILE "$$raw{'reward'}\n";
		}
	close($TABLEFILE);
	print "Таблица сохранена.\n";

}
sub addRawFromString ($){
	my $line = shift;
	my @params = split "\t", $line;
	my %datas = (
		'number' => $params[0],
		'name' => $params[1],
		'adress' => $params[2],
		'date' => $params[3],
		'facul' => $params[4],
		'group' => $params[5],
		'isstar' => $params[6],
		'reward' => $params[7],
	);
	push (@table, \%datas);
}
sub stageTable {
	if($tablename eq undef){
		printf("Таблица не загружена\n");
	}else{
		printf("Загружена таблица $tablename\n");
		printf("В таблице ".($#table+1)." ячеек.\n")
	}
}
sub loadTable {
	print "Загрузить из Студенты.txt? (y/n)\n";
	my $filename;
	$_ = <>;
	chomp($_);
	if($_ eq "y"){
		$filename = "Студенты.txt";
	}else{
		print "Введите название файла: ";
		$filename = <>;
		chomp($filename);
	}
	
	if(open(my $TABLEFILE, "<:encoding(UTF-8)", "$filename")){
		@table=();
		$lineNum = 0;
		while(my $line=<$TABLEFILE>){
			if($lineNum != 0){
				chomp $line;
				addRawFromString($line);
			}
			$lineNum++;
		}
		$tablename = $filename;
		close($TABLEFILE);
		print "Таблица $filename загружена;\n";
	}else{
		print color 'bold red';
		print "Не удалось загрузить '$filename' $!";
		print color 'reset';
	}
}

my $req;
while($req ne "q") {
	if(@table){
		print color 'bold yellow';
		print "No.\t";
		print "Студенческий\t";
		print "ФИО\t\t\t";
		print "Адрес\t\t\t\t";
		print "Зачислен\t";
		print "Фак.\t";
		print "Группа\t";
		print "Староста\t";
		print "Степендия\t";
		print "\n";
		
		$num = 0;
		foreach my $raw (@table){
			$num++;
			print "$num\t";
			print "$$raw{'number'}\t";
			print "$$raw{'name'}\t";
			print "$$raw{'adress'}\t";
			print "$$raw{'date'}\t";
			print "$$raw{'facul'}\t";
			print "$$raw{'group'}\t";
			if($$raw{'isstar'} eq "true"){
				printf "Да";
			}else{
				printf "Нет";
			}
			print "\t\t";
			print "$$raw{'reward'}\n";
		}
		print color 'reset';
	}

	print color 'bold blue';
	print "\nИспользуйте следующие команды:\n";
	print color 'reset';
	print color 'bold green';
		print "l";
	print color 'reset';
	print "oad - Загрузить таблицу;\n";

	print color 'bold green';
		print "s";
	print color 'reset';
	print "tatus - Текущее состояние;\n";

	print color 'bold green';
		print "a";
	print color 'reset';
	print "dd - Добавить запись;\n";

	print color 'bold green';
		print "r";
	print color 'reset';
	print "emove - Удалить запись;\n";

	print color 'bold green';
		print "f";
	print color 'reset';
	print "ilter - Сортировать таблицу;\n";

	print color 'bold green';
		print "w";
	print color 'reset';
	print "rite - Сохранить изменения в файл;\ns";

	print color 'bold green';
		print "e";
	print color 'reset';
	print "lect - Выбрать по части запроса;\n";

	print color 'bold green';
		print "q";
	print color 'reset';
	print "uit - Выйти;\n";

	print "Команда ";

	$req = <STDIN>;
	chomp($req);
	print color 'bold green';
	given($req) {
		when("l"){#load
			print "Загружаем таблицу;\n";
			loadTable();
		}
		when("s"){#stage
			print "Текущее состояние;\n"; 
			stageTable();
		}
		when("a"){#add
			print "Добавляем запись;\n";
			addRaw();
		}
		when("r"){#remove
			print "Удаляем запись;\n"; 
			remRaw();
		}
		when("f"){#filter
			print "Сортируем таблицу;\n";
			sortTable(); 
		}
		when("w"){#write
			print "Сохраняем в файл;\n"; 
			saveTable();
		}
		when("e"){#select
			print "Выбираем по части запроса;\n";
			selectTable();
		}
		when("q"){
			#exit
		}
		default{
			print color 'bold red';
			print "Команда $req не найдена, попробуйте снова;\n";
			print color 'reset';
		}
	}
	print color 'reset';
	print "\n";
}
print "Выход;\n";




#В программе реализовать возможность
#	считать с файла таблицу, 
#	вывести в консоль текущее состояние, 
#	добавить запись, 
#	удалить запись по уникальному полю ( ID – число, уникальное в таблице), 
#	отсортировать по столбцу с указанным номером(алгоритм быстрой сортировки, строку заголовка не сортировать), 
#	записать изменения в файл. 

#Так же, реализовать функцию 
#	вывода на экран всех записей, соответствующих части запроса, вводимого пользователем(аргумент функции) ( Иван – Иван, Иванов, Иванович).
