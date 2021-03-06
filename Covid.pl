% Base de Conhecimento com informacao utentes, centro_saude, staff,vacinaçao.


% SICStus PROLOG: Declaracoes iniciais
:- style_check(-discontiguous).
:- style_check(-singleton).

% Definicoes iniciais

:- op( 900,xfy,'::' ).
:- op(900, xfy, ':::').
:- dynamic '::'/2.
:- dynamic ':::'/2.
:- dynamic excecao/1.
:- dynamic '-'/1.
:- dynamic utente/10.
:- dynamic centro_saude/5.
:- dynamic staff/4.
:- dynamic vacinacao_Covid/7.
:- dynamic data/3.
:- dynamic emailIncertoUtente/1.
:- dynamic moradaIncertaUtente/1.
:- dynamic profissaoImprecisaUtente/1.
:- dynamic dataNascimentoImprecisaUtente/1.
:- dynamic nomeIncertoCentro/1.
:- dynamic emailImprecisoCentro/1.
:- dynamic emailIncertoStaff/1.
:- dynamic emailImprecisoStaff/1.
:- dynamic diaIncertoVacinacao/2.
:- dynamic staffImprecisoVacinacao/2.
:- dynamic nulo/1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% POVOAMENTO
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

% Extensao do predicado utente : ID Utente, Seguranca_Social,Nome,Data_Nasc, Email, Telefone, Morada, Profissao, LDoencas,
% CentroSaude -> {V,F}
utente(1,21455655,'Luis',1970,'luis@gmail.com',936696454,'Adaufe','Estudante',['Doenca coronaria','Doenca respiratoria'],1).
utente(2,31455655,'Filipe',1969,'filipe@gmail.com',936696100,'Barcelos','Estudante',['Diabetes'],1).
utente(3,41455655,'Jose',1990,'j@gmail.com',936696151,'Esposende','Estudante',[],1).
utente(4,42455655,'Diogo',1998,'d@gmail.com',936696171,'Aveiro','Estudante',['Doenca coronaria'],1).
utente(5,43455655,'Rui',1936,'r@gmail.com',936696190,'Braga','Estudante',['Diabetes'],1).
utente(6,41454355,'Paulo',1980,'p@gmail.com',936738461,'Esposende','Medico',[],2).
utente(7,75355655,'Beatriz',1995,'b@gmail.com',936973645,'Aveiro','Enfermeiro',[],2).
utente(8,43455692,'Maria',1951,'m@gmail.com',912348248,'Braga','Estudante',[],2).
utente(9,42487435,'Carlos',1983,'c@gmail.com',936827634,'Aveiro','Estudante',['Artroses'],2).
utente(10,12345678,'Antonio',2000,email_desc,965269469,'Viana Castelo','Estudante',[],1).
utente(11,87654321,'Ricardo', 1983,'ri@gmail.com',965269477,morada_Desc,'Padeiro',[],1).
utente(12,13243546,'Bruno', 1993,email_desc,965233333,'Portimao','Ferreiro',[],2).
utente(13,86756453,'Fernando', 1989,'f@gmail.com',967269477,morada_Desc,'Motorista',[],3).
utente(16,56789321,'Vasco',1957,email_interdito,912345679,'Porto','Contabilista',['Artroses'],3).
utente(17,nss_interdito,'Evaristo',1976,'e@gmail.com',922222222,'Leixoes','Pedreiro',[],2).

-utente(10,12345678,'Antonio',2000,'antonio@gmail.com',965269469,'Viana Castelo','Estudante',[],1).

%-------------------------------------------------
% Aplicação da negação forte para o predicado utente
-utente(ID, NSS, Nome, Data_Nasc, Email, Telefone, Morada, Profissao, LDoencas, Centro_Saude) :-
    nao(utente(ID, NSS, Nome, Data_Nasc, Email, Telefone, Morada, Profissao, LDoencas, Centro_Saude)),
    nao(excecao(utente(ID, NSS, Nome, Data_Nasc, Email, Telefone, Morada, Profissao, LDoencas, Centro_Saude))).

% Extensao do predicado 'centro_saude' : ID Centro, Nome, Morada, Telefone,
% Email -> {V,F}
centro_saude(1,'BragaH','Braga',999999999,'bragah@gmail.com').
centro_saude(2,'GuimaraesH','Guimaraes',999999998,'guimaraesh@gmail.com').
centro_saude(3,nome_desc,'Viseu',999999997,'viseuh@gmail.com').

-centro_saude(3,'HViseu','Viseu',999999997,'viseuh@gmail.com').

%-------------------------------------------------
% Aplicação do PMF para o predicado centro_saude

-centro_saude(ID, Nome, Morada, Telefone, Email) :-
    nao(centro_saude(ID, Nome, Morada, Telefone, Email)),
    nao(excecao(centro_saude(ID, Nome, Morada, Telefone, Email))).

% Extensao do predicado 'staff' : ID staff, ID Centro, Nome, Email -> {V,F}
staff(1,1,'Luis','luis@gmail.com').
staff(2,2,'Paulo','paulo@gmail.com').
staff(3,1,'Francisco','francisco@gmail.com').
staff(4,2,'Joao','joao@gmail.com').
staff(5,3,'Xavier',email_desc).

%-------------------------------------------------
% Aplicação do PMF para o predicado staff

-staff(ID_Staff, ID_Centro, Nome, Email) :-
    nao(staff(ID_Staff, ID_Centro, Nome, Email)),
    nao(excecao(staff(ID_Staff, ID_Centro, Nome, Email))).

% Conhecimento imperfeito incerto para o predicado utente

excecao(utente(ID,SS,Nome,Data_Nasc,_,Telefone,Morada,Profissao,LDoencas,Centro_Saude)) :- utente(ID,SS,Nome,Data_Nasc,email_desc,Telefone,Morada,Profissao,LDoencas,Centro_Saude).
emailIncertoUtente(10).
emailIncertoUtente(12).

excecao(utente(ID,SS,Nome,Data_Nasc,Email,Telefone,_,Profissao,LDoencas,Centro_Saude)) :- utente(ID,SS,Nome,Data_Nasc,Email,Telefone,morada_Desc,Profissao,LDoencas,Centro_Saude).
moradaIncertaUtente(11).
moradaIncertaUtente(13).

% Conhecimento imperfeito incerto para o predicado centro_saude

excecao(centro_saude(ID,_,Morada,Telefone,Email)) :- centro_saude(ID,nome_desc,Morada,Telefone,Email).
nomeIncertoCentro(3).

% Conhecimento imperfeito incerto para o predicado staff

excecao(staff(ID, Centro, Nome,_)) :- staff(ID, Centro, Nome, email_desc).
emailIncertoStaff(5).

% Conhecimento impreciso para o predicado utente

excecao(utente(14,65748392,'Tiago',1990,'t@gmail.com',925434567,'Tomar','Canalizador',[],2)).
excecao(utente(14,65748392,'Tiago',1990,'t@gmail.com',925434567,'Tomar','Eletricista',[],2)).
profissaoImprecisaUtente(14).

excecao(utente(15,56789123,'Nuno',Data,'n@gmail.com',912345678,'Albufeira','Mecanico',[],1)) :-  integer(Data), Data >= 1960, Data =< 1965.
dataNascimentoImprecisaUtente(15).

% Conhecimento impreciso para o predicado centro_saude

excecao(centro_saude(4,'GuardaH','Guarda',999999996,'guardah@gmail.com')).
excecao(centro_saude(4,'GuardaH','Guarda',999999996,'hguarda@gmail.com')).
emailImprecisoCentro(4).

% Conhecimento impreciso para o predicado staff

excecao(staff(6,1,'Bernardo','bernardo@gmail.com')).
excecao(staff(6,1,'Bernardo','bern@gmail.com')).
emailImprecisoStaff(6).

% Conhecimento interdito para o predicado utente

excecao(utente(ID,SS,Nome,Data_Nasc,_,Telefone,Morada,Profissao,LDoencas,Centro_Saude)) :- utente(ID,SS,Nome,Data_Nasc,email_interdito,Telefone,Morada,Profissao,LDoencas,Centro_Saude).

nulo(email_interdito).
+utente(_,_,_,_,_,_,_,_,_,_) :: (solucoes( Email, (utente(16,56789321,'Vasco',1957,Email,912345678,'Porto','Contabilista',['Artroses'],3),
                                 nao( nulo(Email))), S),
                                 comprimento(S, N),
                                 N == 0).

excecao(utente(ID,_,Nome,Data_Nasc,Email,Telefone,Morada,Profissao,LDoencas,Centro_Saude)) :- utente(ID,nss_interdito,Nome,Data_Nasc,Email,Telefone,Morada,Profissao,LDoencas,Centro_Saude).

nulo(nss_interdito).
+utente(_,_,_,_,_,_,_,_,_,_) :: (solucoes( NSS, (utente(17,NSS,'Evaristo',1976,'e@gmail.com',922222222,'Leixoes','Pedreiro',[],2),
								nao( nulo(NSS))), S),
								comprimento(S, N),
								N == 0).

% Extensao do predicado 'vacinacao_Covid' : ID staff, ID Utente, Data, Vacina, Toma -> {V,F}
% Utente 1 - 2 vacinas fase 1
vacinacao_Covid(1, 1, 11, 1, 2021, 'AstraZeneca', 1).
vacinacao_Covid(1, 1, 11, 4, 2021, 'AstraZeneca', 2).
vacinacao_Covid(3, 2, 30, 5, 2021, 'Moderna', 1).
vacinacao_Covid(2, 3, 12, 5, 2021, 'PFizer', 1).
vacinacao_Covid(1, 4, 11, 11, 2021, 'Moderna', 1).
vacinacao_Covid(1, 4, 14, 12, 2021, 'Moderna', 2).
vacinacao_Covid(4, 6, 12, 2, 2021, 'PFizer', 1).
vacinacao_Covid(4, 6, 12, 3, 2021, 'PFizer', 2).
vacinacao_Covid(2, 7, 1, 3, 2021, 'AstraZeneca', 2).

-vacinacao_Covid(2, 9, 1, 6, 2021, 'PFizer', 1).

%-------------------------------------------------
% Aplicação do PMF para o predicado vacinacao_Covid

-vacinacao_Covid(ID_Staff, ID_Utente, Dia, Mes, Ano, Vacina, Toma) :-
    nao(vacinacao_Covid(ID_Staff, ID_Utente, Dia, Mes, Ano, Vacina, Toma)),
    nao(excecao(vacinacao_Covid(ID_Staff, ID_Utente, Dia, Mes, Ano, Vacina, Toma))).

% Conhecimento imperfeito incerto para o predicado vacinacao_Covid

excecao(vacinacao_Covid(2, 9, Dia, 6, 2021, 'PFizer',1)) :- integer(Dia), Dia >= 1, Dia =< 31.
diaIncertoVacinacao(2,9).

% Conhecimento imperfeito impreciso para o predicado vacinacao_Covid

excecao(vacinacao_Covid(ID_Staff, 11, 2, 4, 2021, 'AstraZeneca', 1)) :- contains(ID_Staff, [1, 3]).
staffImprecisoVacinacao(1,11).
staffImprecisoVacinacao(3,11).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% INVARIANTES
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

% Invariante:  nao permite a insercao de conhecimento repetido
+utente(ID,_,_,_,_,_,_,_,_,_)::
	(solucoes(ID,utente(ID,_,_,_,_,_,_,_,_,_),Lista),
	comprimento(Lista,N), N==1).

+utente(_,SS,_,_,_,_,_,_,_,_)::
	(solucoes(SS,utente(_,SS,_,_,_,_,_,_,_,_),Lista),
	comprimento(Lista,N), N==1).

+utente(_,_,_,_,E,_,_,_,_,_)::
	(solucoes(E,utente(_,_,_,_,E,_,_,_,_,_),Lista),
	comprimento(Lista,N), N==1).

+utente(_,_,_,_,_,T,_,_,_,_)::
	(solucoes(T,utente(_,_,_,_,_,T,_,_,_,_),Lista),
	comprimento(Lista,N), N==1).

+centro_saude(ID,_,_,_,_)::
	(solucoes(ID,centro_saude(ID,_,_,_,_),Lista),
	comprimento(Lista,N), N==1).

+centro_saude(_,_,_,T,_)::
	(solucoes(T,centro_saude(_,_,_,T,_),Lista),
	comprimento(Lista,N), N==1).

+centro_saude(_,_,_,_,E)::
	(solucoes(E,centro_saude(_,_,_,_,E),Lista),
	comprimento(Lista,N), N==1).

+staff(ID,_,_,_)::
	(solucoes(ID,staff(ID,_,_,_),Lista),
	comprimento(Lista,N), N==1).

+staff(_,_,_,E)::
	(solucoes(E,staff(_,_,_,E),Lista),
	comprimento(Lista,N), N==1).

+vacinacao_Covid(_,ID_Utente,_,_,_,_,Toma)::
	(solucoes((ID_Utente,Toma),vacinacao_Covid(_,ID_Utente,_,_,_,_,Toma),Lista),
	comprimento(Lista,N), N==1).


% Invariante:  nao permite a remoção de conhecimento inexistente
-utente(ID,_,_,_,_,_,_,_,_,_)::
	(solucoes(ID,utente(ID,_,_,_,_,_,_,_,_,_),Lista),
	comprimento(Lista,N), N==1).

-centro_saude(ID,_,_,_,_)::
	(solucoes(ID,centro_saude(ID,_,_,_,_),Lista),
	comprimento(Lista,N), N==1).

-staff(ID,_,_,_)::
	(solucoes((ID,_,_,_),staff(ID,_,_,_),Lista),
	comprimento(Lista,N), N==1).

-vacinacao_Covid(_,ID_Utente,_,_,_,_,Toma)::
	(solucoes(ID_Utente,vacinacao_Covid(_,ID_Utente,_,_,_,_,Toma),Lista),
	comprimento(Lista,N), N==1).


% Invariante: IDs têm que ser números naturais
+utente(ID,_,_,_,_,_,_,_,_,_):: natural(ID).
+centro_saude(ID,_,_,_,_):: natural(ID).
+staff(ID,_,_,_):: natural(ID).


% Invariante: nao admitir vacinas associadas a uma data inválida
+vacinacao_Covid(ID_Staff,ID_Utente,Dia,Mes,Ano,Vacina,Toma):: data(Ano, Mes, Dia).

% Invariante: nao admitir vacinas associadas um staff ou utente inválido
+vacinacao_Covid(ID_Staff,ID_Utente,Dia,Mes,Ano,Vacina,Toma):: (utente(ID_Utente,Q,No,Da,E,T,M,P,D,C),staff(ID_Staff,IdCentro,Nome,Email)).

% Invariante: nao admitir mais de duas tomas da vacina
+vacinacao_Covid(_,_,_,_,_,_,Toma):: contains(Toma,[1,2]).

% Invariante: nao admitir segunda toma da vacina diferente da primeira
+vacinacao_Covid(_,ID_Utente,_,_,_,Vacina,2):: vacinacao_Covid(_,ID_Utente,_,_,_,Vacina,1).

% Invariante: nao admitir staff e utentes de centros de saude diferentes
+vacinacao_Covid(ID_Staff,ID_Utente,_,_,_,_,_):: mesmoCentro(ID_Staff, ID_Utente).

% Invariante: nao admitir utentes associados um centro de saúde inválido
+utente(_,_,_,_,_,_,_,_,_,ID_Centro):: (centro_saude(ID_Centro,_,_,_,_)).

% Invariante: nao admitir utentes com telefone inválido
+utente(_,_,_,_,_,Tel,_,_,_,_):: telefone(Tel).

% Invariante: Telefone tem que ser válido
+centro_saude(_,_,_,Tel,_):: telefone(Tel).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% EVOLUÇÃO DE CONHECIMENTO
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

% Extensao do predicado que permite a evolução do conhecimento
evolucao( Termo ) :-
    solucoes( Invariante,+Termo::Invariante,Lista ),
    insercao( Termo ),
    teste( Lista ).

insercao( Termo ) :-
    assert( Termo ).
insercao( Termo ) :-
    retract( Termo ),!,fail.

teste( [] ).
teste( [R|LR] ) :-
    R,
    teste( LR ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado demo: Questao,Resposta -> {V,F}
%                            Resposta = { verdadeiro,falso,desconhecido }

demo( Questao,verdadeiro ) :-
    Questao.
demo( Questao,falso ) :-
    -Questao.
demo( Questao,desconhecido ) :-
    nao( Questao ),
    nao( -Questao ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% INVOLUÇÃO DE CONHECIMENTO
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

% Extensao do predicado que permite a involucao do conhecimento
involucao( Termo ) :-
    solucoes( Invariante,-Termo::Invariante,Lista ),
	teste( Lista ),
    remocao( Termo ).


remocao( Termo ) :-
    retract( Termo ).
remocao( Termo ) :-
    assert( Termo ),!,fail.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% ADIÇÃO DE CONHECIMENTO PERFEITO
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

registaUtente(ID,Q,Nome,Data,E,T,M,P,D,C) :- evolucao(utente(ID,Q,Nome,Data,E,T,M,P,D,C)).

registaCentro(ID,N,M,T,E) :- evolucao(centro_saude(ID,N,M,T,E)).

registaStaff(ID,IdCentro,Nome,Email) :- evolucao(staff(ID,IdCentro,Nome,Email)).

registaVacina(ID_Staff,ID_Utente,Dia,Mes,Ano,Vacina,Toma) :- evolucao(vacinacao_Covid(ID_Staff,ID_Utente,Dia,Mes,Ano,Vacina,Toma)).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% ADIÇÃO DE CONHECIMENTO IMPERFEITO
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

registaUtenteMoradaIncerta(ID, NSS, Nome, Data, Email, Telefone, Profissao, LDoencas, Centro) :- evolucaoMoradaIncerta(utente(ID, NSS, Nome, Data, Email, Telefone, morada_Desc,Profissao, LDoencas, Centro)).

evolucaoMoradaIncerta(utente(ID, NSS, Nome, Data, Email, Telefone, morada_Desc,Profissao, LDoencas, Centro)) :- evolucaoDesconhecido(utente(ID, NSS, Nome, Data, Email, Telefone, Morada, Profissao, LDoencas, Centro)), assert(moradaIncertaUtente(ID)).

registaStaffEmailImpreciso(ID, Centro, Nome,[Email|T]) :- evolucaoEmailImpreciso(staff(ID, Centro, Nome, [Email|T])), assert( emailImprecisoStaff(ID) ).

evolucaoEmailImpreciso(staff(ID, Centro, Nome, [])).
evolucaoEmailImpreciso(staff(ID, Centro, Nome,[Email|T])) :- obtemInvariantes(excecao(staff(ID, Centro, Nome,Email)), LI1, LI2),
					  insercao(excecao(staff(ID, Centro, Nome,Email))), teste( LI1 ), teste( LI2 ),
					  evolucaoEmailImpreciso( staff(ID, Centro, Nome,T)).

registaCentroNomeIncerto(ID,Morada,Telefone,Email) :- evolucaoNomeIncerto(centro_saude(ID,nome_desc,Morada,Telefone,Email)).

evolucaoNomeIncerto(centro_saude(ID,nome_desc,Morada,Telefone,Email)) :- evolucaoDesconhecido(centro_saude(ID,Nome,Morada,Telefone,Email)), assert(nomeIncertoCentro(ID)).

registaUtenteNSSInterdito(ID, NSS, Nome, Data, Email, Telefone, Morada, Profissao, LDoencas, Centro) :- nao(integer(NSS)), evolucaoNSSInterdito(utente(ID, NSS, Nome, Data, Email, Telefone, Morada,Profissao, LDoencas, Centro)).

evolucaoNSSInterdito(utente(ID, NSSInterdito, Nome, Data, Email, Telefone, Morada, Profissao, LDoencas, Centro)) :- 
					obtemInvariantes(utente(ID, NSSInterdito, Nome, Data, Email, Telefone, Morada, Profissao, LDoencas, Centro), LI1, LI2),
					insercao(utente(ID, NSSInterdito, Nome, Data, Email, Telefone, Morada, Profissao, LDoencas, Centro)), teste(LI1), teste(LI2),
					assert(nulo(NSSInterdito)),
					assert((excecao(utente(ID1, NSS1, Nome1, Data1, Email1, Telefone1, Morada1, Profissao1, LDoencas1, Centro1)) :- utente(ID1, NSSinterdito, Nome1, Data1, Email1, Telefone1, Morada1, Profissao1, LDoencas1, Centro1))),
					assert((+utente(ID1, NSS1, Nome1, Data1, Email1, Telefone1, Morada1, Profissao1, LDoencas1, Centro1) :: (solucoes(NSS1, (utente(ID, NSS1, Nome, Data, Email, Telefone, Morada, Profissao, LDoencas, Centro), nao(nulo(NSS1))), S), comprimento(S, 0)))).

evolucaoDesconhecido(Termo) :-
	obtemInvariantes( Termo, LI1, LI2),
	insercao(Termo),
	teste( LI1 ), teste( LI2 ).

obtemInvariantes(Termo, LI1, LI2) :-
	solucoes(Invariante, +Termo:::Invariante, LI1),
	solucoes(Invariante, +Termo::Invariante, LI2).
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% PERMITE PASSAR CONHECIMENTO INCERTO E IMPRECISO A CONHECIMENTO PERFEITO
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

removeExcecoes([]).
removeExcecoes([H|T]) :- involucao(H), removeExcecoes(T).

% Adicionar Email Utente (incerto)
registaUtente(ID,Q,Nome,Data,E,T,M,P,D,C) :- emailIncertoUtente(ID),
											 involucao(utente(ID,Q,Nome,Data,email_desc,T,M,P,D,C)),
											 involucao(emailIncertoUtente(ID)),
											 evolucao(utente(ID,Q,Nome,Data,E,T,M,P,D,C)).

% Adicionar Morada Utente (incerto)
registaUtente(ID,Q,Nome,Data,E,T,M,P,D,C) :- moradaIncertaUtente(ID),
											 involucao(utente(ID,Q,Nome,Data,E,T,morada_Desc,P,D,C)),
											 involucao(moradaIncertaUtente(ID)),
											 evolucao(utente(ID,Q,Nome,Data,E,T,M,P,D,C)).

% Adicionar Profissao Utente (impreciso)
registaUtente(ID,Q,Nome,Data,E,T,M,P,D,C) :- profissaoImprecisaUtente(ID),
											 solucoes(excecao(utente(ID,Q,Nome,Data,E,T,M,Ps,D,C)), (excecao(utente(ID,Q,Nome,Data,E,T,M,Ps,D,C))), R), 
											 comprimento(R,N), N>0, removeExcecoes(R),
											 evolucao(utente(ID,Q,Nome,Data,E,T,M,P,D,C)).

% Adicionar Data Nascimento Utente (impreciso)
registaUtente(ID,Q,Nome,Data,E,T,M,P,D,C) :- dataNascimentoImprecisaUtente(ID),
											 solucoes(excecao(utente(ID,Q,Nome,Datas,E,T,M,P,D,C)), (excecao(utente(ID,Q,Nome,Datas,E,T,M,P,D,C))), R), 
											 comprimento(R,N), N>0, removeExcecoes(R),
											 evolucao(utente(ID,Q,Nome,Data,E,T,M,P,D,C)).

% Adicionar Nome Centro Saude (incerto)
registaCentro(ID,N,M,T,E) :- nomeIncertoCentro(ID),
							 involucao(centro_saude(ID,nome_desc,M,T,E)),
							 involucao(nomeIncertoCentro(ID)),
							 evolucao(centro_saude(ID,N,M,T,E)).

% Adicionar Email Centro Saude (impreciso)
registaCentro(ID,N,M,T,E) :- emailImprecisoCentro(ID),
							 solucoes(excecao(centro_saude(ID,N,M,T,Es)), excecao(centro_saude(ID,N,M,T,Es)), R),
							 comprimento(R,N), N>0, removeExcecoes(R),
							 evolucao(centro_saude(ID,N,M,T,E)).

% Adicionar Email Staff (incerto)
registaStaff(ID,IdCentro,Nome,Email) :- emailIncertoStaff(ID),
										involucao(staff(ID,IdCentro,Nome,email_desc)),
										involucao(emailIncertoStaff(ID)),
										evolucao(staff(ID,IdCentro,Nome,Email)).

% Adicionar Email Staff (impreciso)
registaStaff(ID,IdCentro,Nome,Email) :- emailImprecisoStaff(ID),
										solucoes(excecao(staff(ID,IdCentro,Nome,Emails)), excecao(staff(ID,IdCentro,Nome,Emails)), R),
										comprimento(R,N), N>0, removeExcecoes(R),
										involucao(emailImprecisoStaff(ID)),
										evolucao(staff(ID,IdCentro,Nome,Email)).

% Adicionar Dia da administracao da Vacina (impreciso)
registaVacina(ID_Staff,ID_Utente,Dia,Mes,Ano,Vacina,Toma) :- diaIncertoVacinacao(ID_Staff, ID_Utente),
															 solucoes(excecao(vacinacao_Covid(ID_Staff,ID_Utente,Dias,Mes,Ano,Vacina,Toma)), excecao(vacinacao_Covid(ID_Staff,ID_Utente,Dias,Mes,Ano,Vacina,Toma)), R),
															 comprimento(R,N), N>0, removeExcecoes(R),
															 evolucao(vacinacao_Covid(ID_Staff,ID_Utente,Dia,Mes,Ano,Vacina,Toma)).

% Adicionar Staff à administracao da Vacina (impreciso)
registaVacina(ID_Staff,ID_Utente,Dia,Mes,Ano,Vacina,Toma) :- staffImprecisoVacinacao(ID_Staff,ID_Utente),
															 solucoes(excecao(vacinacao_Covid(ID_Staffs,ID_Utente,Dia,Mes,Ano,Vacina,Toma)), excecao(vacinacao_Covid(ID_Staffs,ID_Utente,Dia,Mes,Ano,Vacina,Toma)), R),
															 comprimento(R,N), N>0, removeExcecoes(R),
															 solucoes(staffImprecisoVacinacao(ID_Staff, ID_Utente), staffImprecisoVacinacao(ID_Staff, ID_Utente), Res), comprimento(Res, Size), Size>0, removeExcecoes(Res),
															 evolucao(vacinacao_Covid(ID_Staff,ID_Utente,Dia,Mes,Ano,Vacina,Toma)).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% INVARIANTES DE CONHECIMENTO IMPERFEITO
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Nao e permitido adicionar conhecimento imperfeito a factos que ja sao caracterizados como imperfeito

+utente(ID,Q,Nome,Data,E,T,M,P,D,C) ::: nao(nulo(Q)).

+excecao(utente(ID,Q,Nome,Data,E,T,M,P,D,C)) ::: nao(nulo(Q)).

+utente(ID,Q,Nome,Data,E,T,M,P,D,C) ::: nao(moradaIncertaUtente(ID)).

+excecao(utente(ID,Q,Nome,Data,E,T,M,P,D,C)) ::: nao(moradaIncertaUtente(ID)).

+centro_saude(ID, Nome, Morada, Telefone, Email) ::: nao(nomeIncertoCentro(ID)).

+excecao(centro_saude(ID, Nome, Morada, Telefone, Email)) ::: nao(nomeIncertoCentro(ID)).

+staff(ID, Centro, Nome, Email) ::: nao(emailImprecisoStaff(ID)).

+excecao(staff(ID, Centro, Nome, Email)) ::: nao(emailImprecisoStaff(ID)).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% REMOÇÃO DE CONHECIMENTO
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

removeUtente(ID) :- vacinasUtente(ID,R), removeVacinasUtente(R), involucao(utente(ID,_,_,_,_,_,_,_,_,_)).

vacinasUtente(ID,R) :- solucoes((ID,Toma), (vacinacao_Covid(_,ID,_,_,_,_,Toma)), R).

removeVacinasUtente([]).
removeVacinasUtente([(ID,Toma)|T]) :- involucao(vacinacao_Covid(_,ID,_,_,_,_,Toma)), removeVacinasUtente(T).


removeCentro(ID) :- staffCentro(ID,L), removeStaffCentro(L), utentesCentro(ID,L2), removeUtentesCentro(L2), involucao(centro_saude(ID,_,_,_,_)).

staffCentro(ID,R) :- solucoes(ID_Staff, (staff(ID_Staff,ID,_,_)), R).

utentesCentro(ID,R) :- solucoes(ID_Utente, (utente(ID_Utente,_,_,_,_,_,_,_,_,ID)), R).

removeStaffCentro([]).
removeStaffCentro([ID|T]) :- vacinasStaff(ID,R), removeVacinasStaff(R), involucao(staff(ID,_,_,_)), removeStaffCentro(T).

removeUtentesCentro([]).
removeUtentesCentro([ID|T]) :- vacinasUtente(ID,R), removeVacinasUtente(R), involucao(utente(ID,_,_,_,_,_,_,_,_,_)), removeUtentesCentro(T).


removeStaff(ID) :- vacinasStaff(ID,R), removeVacinasStaff(R), involucao(staff(ID,_,_,_)).

vacinasStaff(ID,R) :- solucoes((ID_Utente, Toma), (vacinacao_Covid(ID,ID_Utente,_,_,_,_,Toma)), R).

removeVacinasStaff([]).
removeVacinasStaff([(ID,Toma)|T]) :- involucao(vacinacao_Covid(_,ID,_,_,_,_,Toma)), removeVacinasStaff(T).


removeVacina(ID_Utente,Toma) :- involucao(vacinacao_Covid(_,ID_Utente,_,_,_,_,Toma)).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% PERMITIR DEFINIÇÃO DE FASES DE VACINAÇÃO
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

% Extensão do predicado que permite identificar utentes que pertencem à primeira fase de vacinação
% 'utentes1fase': Resultado -> {V, F}
utentes1fase(R) :- solucoes(ID, (utente(ID,_,_,A,_,_,_,P,L,_), criterios1fase(A,P,L)), L), removeRepetidos(L,R).

% Extensão do predicado que permite identificar utentes que pertencem à segunda fase de vacinação
% 'utentes2fase': Resultado -> {V, F}
utentes2fase(R) :- solucoes(ID, (utente(ID,_,_,A,_,_,_,P,L,_), criterios2fase(A,P,L)), L), removeRepetidos(L,R).

% Extensão do predicado que permite identificar utentes que pertencem à terceira fase de vacinação
% 'utentes3fase': Resultado -> {V, F}
utentes3fase(R) :- solucoes(ID, (utente(ID,_,_,A,_,_,_,P,L,_), criterios3fase(A,P,L)), L), removeRepetidos(L,R).

% Extensão do predicado que permite identificar utentes que foram vacinados na primeira fase
% 'vacinados1fase': Resultado -> {V, F}
vacinados1fase(R) :- solucoes(ID, (vacinacao_Covid(_,ID,_,M,_,_,1),M<5), R).

% Extensão do predicado que permite identificar utentes que foram vacinados na segunda fase
% 'vacinados2fase': Resultado -> {V, F}
vacinados2fase(R) :- solucoes(ID, (vacinacao_Covid(_,ID,_,M,_,_,1),M>4,M<10), R).

% Extensão do predicado que permite identificar utentes que foram vacinados na terceira fase
% 'vacinados3fase': Resultado -> {V, F}
vacinados3fase(R) :- solucoes(ID, (vacinacao_Covid(_,ID,_,M,_,_,1),M>9), R).

% Extensão do predicado que permite identificar criterios da 1ª fase
% 'criterios1fase': Resultado -> {V, F}
criterios1fase(Ano,Profissao,LDoencas) :- 2021 - Ano >= 80.
criterios1fase(Ano,Profissao,LDoencas) :- profissaoRisco(Profissao).
criterios1fase(Ano,Profissao,LDoencas) :- listaDoencas(LDoencas), 2021 - Ano >= 50.

% Extensão do predicado que permite identificar criterios da 2ª fase
% 'criterios2fase': Resultado -> {V, F}
criterios2fase(Ano,Profissao,LDoencas) :- nao(profissaoRisco(Profissao)), nao(listaDoencas(LDoencas)),2021 - Ano >= 65, 2021 - Ano < 80.
criterios2fase(Ano,Profissao,LDoencas) :- nao(profissaoRisco(Profissao)), nao(listaDoencas(LDoencas)),listaDoencas2(LDoencas), 2021 - Ano >= 50, 2021 - Ano < 65.

% Extensão do predicado que permite identificar criterios da 3ª fase
% 'criterios3fase': Resultado -> {V, F}
criterios3fase(Ano,Profissao,LDoencas) :- nao(profissaoRisco(Profissao)), 2021 - Ano < 50.
criterios3fase(Ano,Profissao,LDoencas) :- nao(profissaoRisco(Profissao)), nao(listaDoencas(LDoencas)),nao(listaDoencas2(LDoencas)), 2021 - Ano >= 50, 2021 - Ano < 65.

% Extensão do predicado que permite identificar se uma lista contém uma doença de risco 1
% 'listaDoencas': Resultado -> {V, F}
listaDoencas([H|_]) :- doencaRisco(H).
listaDoencas([_|T]) :- listaDoencas(T).

% Extensão do predicado que permite identificar se uma lista contém uma doença de risco 2
% 'listaDoencas2': Resultado -> {V, F}
listaDoencas2([H|_]) :- doencaRisco2(H).
listaDoencas2([_|T]) :- listaDoencas2(T).

% Extensão do predicado que permite identificar se uma doença é de risco 1
% 'doencaRisco': Resultado -> {V, F}
doencaRisco('Insuficiência cardíaca').
doencaRisco('Doença coronária').
doencaRisco('Insuficiência renal').
doencaRisco('Doença respiratória').

% Extensão do predicado que permite identificar se uma doença é de risco 2
% 'doencaRisco2': Resultado -> {V, F}
doencaRisco2('Diabetes').
doencaRisco2('Insuficiência hepática').
doencaRisco2('Hipertensão arterial').
doencaRisco2('Obesidade').

% Extensão do predicado que permite identificar se uma profissão é de risco
% 'profissaoRisco': Resultado -> {V, F}
profissaoRisco('Medico').
profissaoRisco('Enfermeiro').
profissaoRisco('Militar').
profissaoRisco('Segurança').
profissaoRisco('Residente de lar de idosos').

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% IDENTIFICAR PESSOAS VACINADAS
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

% Extensão do predicado que permite identificar utentes vacinados
% 'utentesVacinados': Resultado -> {V, F}
utentesVacinados(R) :- solucoes(ID,vacinacao_Covid(_,ID,_,_,_,_,_),L), removeRepetidos(L,R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% IDENTIFICAR PESSOAS NÃO VACINADAS
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

% Extensão do predicado que permite identificar utentes não vacinados
% 'utentesNVacinados': Resultado -> {V, F}
utentesNVacinados(R) :- solucoes(ID,(utente(ID,_,_,_,_,_,_,_,_,_),utentesVacinados(LVacinados),nao(contains(ID,LVacinados))),R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% IDENTIFICAR PESSOAS VACINADAS INDEVIDAMENTE
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

% Extensão do predicado que permite identificar utentes vacinados indevidamente
% 'utentesVacinadosInd': Resultado -> {V, F}
utentesVacinadosInd(R) :- utentesInd1(L1),utentesInd2(L2),concat(L1,L2,L),utentesInd3(L3),concat(L, L3, R).

utentesInd1(R) :- solucoes(ID, (utente(ID,_,_,_,_,_,_,_,_,_),utentes1fase(UF1),vacinados2fase(VF1),contains(ID,UF1),contains(ID,VF1)), L2),
				  solucoes(ID, (utente(ID,_,_,_,_,_,_,_,_,_),utentes1fase(UF2),vacinados3fase(VF2),contains(ID,UF2),contains(ID,VF2)), L3),
				  concat(L2,L3,R).
utentesInd2(R) :- solucoes(ID, (utente(ID,_,_,_,_,_,_,_,_,_),utentes2fase(UF1),vacinados1fase(VF1),contains(ID,UF1),contains(ID,VF1)), L1),
				  solucoes(ID, (utente(ID,_,_,_,_,_,_,_,_,_),utentes2fase(UF2),vacinados3fase(VF2),contains(ID,UF2),contains(ID,VF2)), L3),
				  concat(L1,L3,R).
utentesInd3(R) :- solucoes(ID, (utente(ID,_,_,_,_,_,_,_,_,_),utentes3fase(UF1),vacinados1fase(VF1),contains(ID,UF1),contains(ID,VF1)), L1),
                  solucoes(ID, (utente(ID,_,_,_,_,_,_,_,_,_),utentes3fase(UF2),vacinados2fase(VF2),contains(ID,UF2),contains(ID,VF2)), L2),
				  concat(L1,L2,R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% IDENTIFICAR PESSOAS NÃO VACINADAS E QUE SÃO CANDIDATAS
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

% Extensão do predicado que permite identificar utentes não vacinados que são candidatos
% 'utentesNVacinadosCan': Resultado -> {V, F}
utentesNVacinadosCan(R) :- solucoes(ID, (utente(ID,_,_,_,_,_,_,_,_,_),utentesNVacinados(LNV),utentes1fase(L1),utentes2fase(L2),concat(L1,L2,L),contains(ID,L),contains(ID,LNV)), L), removeRepetidos(L,R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% IDENTIFICAR PESSOAS A QUEM FALTA A TOMA DA SEGUNDA VACINA
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

% Extensão do predicado que permite identificar utentes que só tomaram a 1ª toma da vacina
% 'utentes1toma': Resultado -> {V, F}
utentes1toma(R) :- solucoes(ID,(vacinacao_Covid(_,ID,_,_,_,_,1),utentes2toma(L),nao(contains(ID,L))),R).

% Extensão do predicado que permite identificar utentes que tomaram a 2ª toma da vacina
% 'utentes2toma': Resultado -> {V, F}
utentes2toma(R) :- solucoes(ID,vacinacao_Covid(_,ID,_,_,_,_,2),R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SISTEMA DE INFERÊNCIA
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

inferencia(Questao, verdadeiro) :- Questao.
inferencia(Questao, falso) :- -Questao.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% EXTRA
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% LISTAR VACINACAO
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

vacinacao :- listing(vacinacao_Covid).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% IDENTIFICAR ELEMENTO DO STAFF POR ID
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

staffID(ID,R) :- solucoes((ID,I,N,E), staff(ID,I,N,E), R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% LISTAR STAFF
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

staffT :- listing(staff).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% IDENTIFICAR CENTRO DE SAUDE POR ID
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

centroID(ID,R) :- solucoes((ID,N,M,T,E), centro_saude(ID,N,M,T,E), R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% LISTAR CENTRO DE SAUDE
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

centroT :- listing(centro_saude).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% IDENTIFICAR UTENTE POR ID
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

utenteID(ID,R) :- solucoes((ID,Q,No,Da,E,T,M,P,D,C), utente(ID,Q,No,Da,E,T,M,P,D,C), R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% LISTAR UTENTES
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

utenteT :- listing(utente).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% IDENTIFICAR FASE DE VACINAÇÃO DE UM UTENTE
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

faseUtente(ID, 'Primeira Fase') :- utentes1fase(L), contains(ID, L).
faseUtente(ID, 'Segunda Fase') :- utentes2fase(L), contains(ID, L).
faseUtente(ID, 'Terceira Fase') :- utentes3fase(L), contains(ID, L).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% IDENTIFICAR CENTRO DE SAUDE DE UM STAFF
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

centroStaff(ID, Nome) :- staff(ID,ID_Centro,_,_), centro_saude(ID_Centro,Nome,_,_,_).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% IDENTIFICAR VACINAS DADAS POR UM MEMBRO DO STAFF
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

vacinasAdminStaff(ID_Staff,R) :- solucoes(V, vacinacao_Covid(ID_Staff,_,_,_,_,V,_), L), removeRepetidos(L,R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% IDENTIFICAR FREQUENCIA DAS VACINAS
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

frequenciaVacinas(R) :- solucoes(V, vacinacao_Covid(_,_,_,_,_,V,_), L), removeRepetidos(L,L2), vacinaLista(L2,L,R).

vacinaLista([],_,[]).
vacinaLista([H|T],V,[(H,Q)|L]) :- ocorrenciaVacina(H,V,0,Q),vacinaLista(T,V,L).

ocorrenciaVacina(_, [], Acc, Acc).
ocorrenciaVacina(X, [X|T], OldAcc, Res) :- NewAcc is OldAcc + 1, ocorrenciaVacina(X, T, NewAcc, Res).
ocorrenciaVacina(X, [_|T], Acc, Res) :- ocorrenciaVacina(X, T, Acc, Res).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% PREDICADOS AUXILIARES
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

% Extensao do meta-predicado nao: Questao -> {V,F}
nao( Questao ) :- Questao, !, fail.
nao( Questao ).

% Extensão do predicado que permite verificar se um elemento percente a uma lista:
% 'contains':  Elemento, Conjunto -> {V,F}
contains(E,[E|T]).
contains(E,[Y|T]) :- E\=Y, contains(E,T).

% Extensão do predicado que permite verificar se um numero é natural:
% 'natural':  Numero -> {V,F}
natural(N) :- M is N mod 1, M == 0, N > 0.

% Extensao do predicado «adicionar» que insere um elemento numa lista, sem o repetir: Elemento,Lista,Resultado -> {V,F}
add(E,L,L) :- contains(E,L).
add(E, L, [E|L]).

% Extensao do predicado «concatenar», que resulta na concatenação dos elementos da lista L1 com os elementos da lista L2: Lista1,Lista2,Resultado -> {V,F}
concat([], L, L).
concat([H|T], L, R) :- add(H, N, R), concat(T, L, N).

% Extensão do predicado 'solucoes'
solucoes( X,Y,Z ) :-
    findall( X,Y,Z ).

% Extensão do predicado 'comprimento'
comprimento( S,N ) :-
    length( S,N ).

% Extensão do predicado 'removeRepetidos' que remove os elementos repetidos duma lista
removeRepetidos([], []).
removeRepetidos([H|T], R) :- contains(H, T) , removeRepetidos(T, R).
removeRepetidos([H|T], [H|R]) :- nao(contains(H, T)) , removeRepetidos(T, R).

% Extensão do predicado 'bissexto': Ano => {V, F}
bissexto(X) :- X mod 4 == 0.

% Extensão do predicado 'data': Ano, Mes, Dia => {V, F}
data(A,M,D) :- M\=2, A>=2010, contains(M,[1,3,5,7,8,10,12]), D>=0, D=<31.
data(A,M,D) :- M\=2, A>=2010, contains(M,[4,6,9,11]), D>0, D=<30.
data(A,M,D) :- M==2 , bissexto(A), A>=2010, D>0, D=<29.
data(A,M,D) :- M==2 , nao(bissexto(A)), A>=2010, D>0, D=<28.

% Extensão do predicado 'telefone': Tel => {V, F}
telefone(Tel) :- Tel >= 900000000, Tel =< 999999999.

% Extensão do predicado 'mesmoCentro': ID_Staff, ID_Utente => {V, F}
mesmoCentro(ID_Staff, ID_Utente) :- staff(ID_Staff,ID_Centro,_,_), utente(ID_Utente,_,_,_,_,_,_,_,_,ID_Centro).
