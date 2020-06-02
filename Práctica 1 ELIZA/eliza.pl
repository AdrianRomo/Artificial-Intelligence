#Saludo Inicial
system("clear");
print "Hola! Soy Skynet, tu psicólogo virtual, Cuál es tu nombre?\n";
$name = <STDIN>; chomp $name;
$name = lc($name);
#Separando el nombre del enunciado inicial
for ($name) {
	$name =~ s/,//g;
	$statement =~ s/!//g;
	$statement =~ s/á/a/g;
	$statement =~ s/é/e/g;
	$statement =~ s/í/i/g;
	$statement =~ s/ó/o/g;
	$statement =~ s/ú/u/g;
	$statement =~ s/ü/u/g;
}
#Saca el ultimo nombre que se le dio
$name =~ s/(.+)? (dime|refierete|se refieren a mi como|pero todos|me dicen|soy tu|todos me llaman|me llamo|mi nombre es|yo soy|me llamo|soy|puedes llamarme|me gusta que me digan|llamame|puedes decirme)?(.+)/$3/;
if ($name =~ m/(dr\.|dr|doctor)?(hiram)(calvo)?/) {
	$name = ucfirst($name); #Convierte la primer Letra en Mayuscula.
	print "Buen día Doctor $name, supongo viene a evaluar mi inteligencia.\n";#Imprime el nombre junto con pregunta inicial.
}else{
	$name = ucfirst($name);
	print "Hola $name, Cómo puedo ayudarte el día de hoy? \n";#Imprime el nombre junto con pregunta inicial.
}
#Loop de posibles respuestas.
while(1){
	#Enunciado lo convierte a minusculas.
	$statement = <STDIN>; chomp $statement;
	$statement = lc($statement);

	#######################################################################################################
	#								Sustitucion de respuestas en esta parte del codigo :D 											          #	}elsif($statement =~ m/quieres (que te cuente|saber) (acerca|sobre) mi(.|\'?')/){
			#$statement = "Por supuesto, cuéntame sobre ti.";
	#######################################################################################################
	for ($statement) {
		$statement =~ s/!//;
		$statement =~ s/á/a/;
		$statement =~ s/é/e/;
		$statement =~ s/í/i/;
		$statement =~ s/ó/o/;
		$statement =~ s/ú/u/;
		$statement =~ s/ü/u/;

	}

	if($statement =~ m/(.+)?(sentirme|siento)(.+)?/){
		for ($statement) {
				$word = "sentirte";
			}
		$statement = "Por qué crees $word$3 $name?";

	}elsif($statement =~ m/(.+)?(que|en que|cuál)(.+)?(hora|mes|año)(.+)?(es|estamos|tienes)(.+)?/){
		$statement = localtime(),"\n";
	}elsif($statement =~ m/le di (.+) a mi (.+)/){
		$statement = "Por qué le diste $1 a tu $2?";
  }elsif($statement =~ m/limpiar/){
		system("clear");
		$statement = "Listo :) sigo leyendo tus respuestas";
  }elsif($statement =~ m/hola|hey|quihubo|que hubo|buen(a|o)s (dias|tardes|noches)|hol[aeiou]/){
		$statement = "Hola $name! Cómo puedo ayudarte?";
  }elsif($statement =~ m/no se que hacer mi(.+) me (.+)?/){
  	$statement = "Por qué crees que tu$1 te $2?";
	}elsif($statement =~ m/porque (.+)/){
		$statement = "Es esa la unica razón?";
	}elsif($statement =~ m/quieres (que te cuente|saber) (.+)\?/){
		$word = $2;
		for ($statement) {
			$word =~ s/sobre mi /acerca de tu /;
			$word =~ s/sobre mi/acerca de ti/;
			$word =~ s/sobre mi vida/acerca de ti/;
		}

		$statement = "Por supuesto, cuéntame $word.";
	}elsif($statement =~ m/quieres (que te cuente|saber) (acerca|sobre) mi(.+)(.|\'?')/){
		$statement = "Por supuesto, cuéntame sobre tu $1.";
	}elsif($statement =~ m/(hazme|dame|quiero que me|podrías)(.+)/){
		$statement = "Temo que mis habilidades aún no llegan a tanto :(";
	}elsif($statement =~ m/quieres(.+)?/){
		$statement = "Oh, gracias por pensar en lo que quiero pero mejor hablemos de ti.";
	}elsif($statement =~ m/(ayudame|podrías ayudarme|ayuda)(.+)/){
		$statement = "Claro, estoy para ayudarte.";
  }elsif($statement =~ m/quieres (.+) (conmigo|conmiwo)?/){
		$word = $1;			 #crea una palabra en la variable $1
		for ($word){
			$word =~ s/es/e/;
			$word =~ s/conmigo/contigo/;
			$word =~ s/te/me/;
			$word =~ s/ó/aste/;
			$word =~ s/arte/arme/;

		}
    $statement = "Por qué quieres $word conmigo?";
  }elsif($statement =~ m/necesito (.+)/){
		$statement = "Dime más sobre tus necesidades.";
	}elsif($statement =~ m/(por qué|porque|por que) tu no (.+)/){
		$word = $1;			 #crea una palabra en la variable $1
		for ($word){
			$word =~ s/es/e/;
			$word =~ s/conmigo/contigo/;
			$word =~ s/te/me/;
			$word =~ s/ó/aste/;
		}
		$statement = "Estás seguro que quieres que yo $word";
	}elsif($statement =~ m/(porque|por que|por qué) yo no puedo (.+)/){
		$statement = "Yo creo que tu podrás $1, y triunfarás en ello :D";
	}elsif($statement =~ m/(yo soy|soy|creo que soy) (.+)/){
		$statement = "Cómo te convertiste en $2";
	}elsif($statement =~ m/(yo no|no puedo|no podré|no podre) (.+)/){
		$statement = "Cómo sabes que no puedes $2?";
	}elsif($statement =~ m/(ella|el) es (.+)/){
		$statement = "Cómo estás tan seguro de eso?";
	}elsif($statement =~ m/(olvidé|olvide|no recuerdo) mi (.+)/){
		$statement = "Por qué olvidaste tu $2?";
  }elsif($statement =~ m/(olvidé|olvide|no recuerdo) como (.+)/){
  	$statement = "Por qué olvidaste como $2?";
	}elsif($statement =~ m/(^si(.+)?|sip |yeah |yea |me gustaría |estoy de acuerdo |chi)/g){
		$statement = "Ok, cuentame más sobre ello."; #problema con muchisisisimas gracias
	}elsif($statement =~ m/ok|va|okay|esta bien/){
		$statement = "De qué otra cosa quieres hablar $name?";
  }elsif($statement =~ m/no sé|no se/){
  	$statement = "Y qué piensas hacer al respecto?";
	}elsif($statement =~ m/(yo podría|podría|podria) (.+)/){
		$statement = "Por qué podrías $1?";
	}elsif($statement =~ m/(yo tengo|tengo) (.+)/){
		$statement = "Estás seguro que tienes $2?";
	}elsif($statement =~ m/mi (.+) me (.+)/){
		$statement = "Por qué crees que pasaba eso?";
	}elsif($statement =~ m/(por qué|por que) (.+)/){
		$statement = "por qué dices eso??";
	}elsif($statement =~ m/(odio|yo odio) (.+)/){
		$statement = "Por qué odias $1?";
	}elsif($statement =~ m/(.+)?yo creo que (\S*)/){
		$statement = "por qué no me hablas mas acerca de $word."; #crea enunciado
	}elsif($statement =~ m/(yo creo|creo) (.+)/){#creo sentirme mal
		$statement = "Por qué crees que $1?";
	}elsif($statement =~ m/yo (.+)/){
		$statement = "Estás seguro de que tu $1?";
	}elsif($statement =~ m/(.+)?(pues fijate|pues el día de hoy|el día de hoy)(.+)/){
		$statement = "Oh, ya veo, y de acuerdo a eso, en qué crees que necesitas ayuda?";
	}elsif($statement =~ m/(.+)?(llamame|call me|dime|refierete a mi como|quiero que me llames) (.+)/){
		$name = $3;
		$name = lc($name);
		if ($name =~ m/(dr\.|dr|doctor)?(hiram)(calvo)?/) {
			$name = ucfirst($name);
			$statement = "Sospechaba que usted era $name, Mucho Gusto.";
		}else{
			$name = ucfirst($name);
			$statement = "Claro! ahora te diré $name";
		}
	}elsif($statement =~ m/(muchas|muchi|mil|estoy)?(.+)?(gracias|agradecido)(.+)?/g){
		$statement = "No hay de que $name :) De qué más quieres hablar?";
	}elsif($statement =~ m/cuando (.+)/){
		$statement = "por qué no me hablas más de eso?";
	}elsif($statement =~ m/(.+)?(callate|adios|hasta luego|bye|goodbye|hasta la vista baby|hasta pronto|ha sido un placer|un gusto platicar|ayos|vete alv|nos vemos|te veo luego)/){
			print"Excelente Charla $name! Adios!.\n";
			last;
	}elsif($statement =~ m/\S*/){ #Magia, abre archivo ELIZA.txt y busca la palabra no validada
		my $filename = "ELIZA.txt";
		$true = 0;
	  open( my $fh, '<', $filename ) or die "No pudo abrirse $filename: $!";
	      while ( my $line = <$fh> ) {#Recorre todo el .txt si esta, escribe la respuesta predeterminada
					if ($line =~ m/(.+) : (.+)/) {
						$word = $1;
						$ans = $2;
						if ($statement =~ m/(.+)?$word(.+)?/) {
							$statement = $ans;
							$true= $true+1;
							close $fh;
						}
					}
	      }
				close $fh;
				if ($true eq 0) { #En caso de que no esté, da opcion al usuario de agregar la respuesta
					print "No entiendo lo que es \"",$statement,"\" puedes agregar lo que tu responderías a eso a mi diccionario :)\n\nSi no quieres agregarla teclea \"no\"\n";
					$linea = <STDIN>; chomp($linea);
					$linea = lc($linea);
					if ($linea eq "no") {
						close FILE;
						$statement = "Ok, sigamos platicando :)"
					}else{
						open(FILE,">> ELIZA.txt") || die "No pudo abrirse: $!";
						print FILE "\n$statement : $linea";
						print "Guardado con éxito\n";
						close FILE;
						$statement = "Muchas Gracias, recordaré tu respuesta a esa pregunta la próxima vez ;)";
					}
				}
	}
	#Imprime respuesta :D
	$statement = ucfirst($statement);
	print("$statement \n");
}
#limpiar pantalla con "limpiar"
#Como me llamo
#Me gusta jugar
#Mañana
#Quiero Dormir
#Necesito hacer una suma
