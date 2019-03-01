package myArray;

BEGIN { }

#Составить описание 
#класса для определения одномерного массива строк. 

sub new {
	#foreach $item (@_){
		#print $item;
	#}
	#my ($class) = @_;
	my @content = @_;
	my $self = {
		len => $#content,
		content => [1,2,3,4]
	};
	$self{'content'} = \@content;
	#my ($class, %args) = @_;
	bless $self;

	return $self;
}

#sub new () {
    #my ($class, %args) = @_;
    #return bless { %args }, $class;
#}

#Предусмотреть возможность обращения к отдельным строкам массива по индексам, 
sub getByIndex($){
	#TODO
}

#выполнения операций поэлементного сцепления двух массивов с образованием нового массива, 
sub mergeWith(){#TODO Array B
	#TODO
}

#слияния двух массивов с исключением повторяющихся элементов, 
sub mergeWithXOR(){#TODO Array B
	#TODO
}

#а также вывод на экран элемента массива по заданному индексу 
sub printByIndex(){
	#TODO
}

#и всего массива. 
sub printf(){
	#TODO
}

sub sample_method {
	my ($self) = @_;
	@content = $self->{'content'};
	print "Content:\n";

	foreach $item (@content){
		print "\t"."$item"."\n";
	}

	print "Length ".$self->{'len'}."\n";
    #print $self->{'content'};

}

return 1;

END { }


