drop database if exists bdOlimpicos;
create database bdOlimpicos;
use bdOlimpicos;

create table Modalidades(
codModalidade int primary key auto_increment,
nomeModalidade varchar(50)
);

delimiter $$
create procedure insMod(nomeMod varchar(50))
begin
	if not exists (select nomeModalidade from Modalidades where nomeModalidade = nomeMod) then
		insert into Modalidades (nomeModalidade) values (nomeMod);
	end if;
end;
$$

call insMod ('Atletismo');
call insMod ('Natação');
call insMod ('Vôlei de Quadra');
call insMod ('Vôlei de Praia');

-- select codModalidade as 'Código', nomeModalidade as 'Nome' from Modalidades;

create table Provas(
codProva int primary key auto_increment,
nomeProva varchar(100),
codModalidade int
);

alter table Provas add constraint fkModProva foreign key(codModalidade) references Modalidades(codModalidade);

insert into Provas (nomeProva, codModalidade) values ('10.000m Feminino', 1);

-- select codProva as 'Código', nomeProva as 'Nome', codModalidade as 'Modalidade' from Provas;
select nomeProva from Provas where codModalidade = 2;

delimiter $$
create procedure insProva(nomeProv varchar(100), codMod int)
begin
	if not exists (select nomeProva from Provas where nomeProva = nomeProv and codMod = codModalidade) then
		insert into Provas (nomeProva, codModalidade) values (nomeProv, codMod);	
	end if;    
end;
$$
call insProva('10.000m Feminino', 1);
call insProva('10000m Masculino', 1);
call insProva('1500m Masculino', 1);
call insProva('200m Feminino', 1);
call insProva('200m Masculino', 1);
call insProva('20km Marcha Atlética Feminina', 1);
call insProva('20km Marcha Atlética Masculino', 1);
call insProva('3000m com Obstáculos Feminino', 1);
call insProva('3000m com Obstáculos Masculino', 1);
call insProva('400m Feminino', 1);
call insProva('400m Feminino Feminino', 1);
call insProva('400m Masculino', 1);
call insProva('400m com Barreiras Feminina', 1);
call insProva('400m com Barreiras Feminino', 1);
call insProva('400m com Barreiras Masculino', 1);
call insProva('5000m Feminino', 1);
call insProva('5000m Masculino', 1);
call insProva('50km Marcha Atlética', 1);
call insProva('60m Masculino', 1);
call insProva('800m Feminino', 1);
call insProva('800m Masculino', 1);
call insProva('80m com Barreiras Feminino', 1);
call insProva('Arremesso de Peso Feminino', 1);
call insProva('Arremesso de Peso Masculino', 1);
call insProva('Arremesso do Peso Masculino', 1);
call insProva('Cross Country Masculino', 1);
call insProva('Decatlon', 1);
call insProva('Decatlon Masculino', 1);
call insProva('Heptatlo Feminino', 1);
call insProva('Lançamento de Dardo Feminino', 1);
call insProva('Lançamento de Dardo Masculino', 1);
call insProva('Lançamento de Disco Feminino', 1);
call insProva('Lançamento de Disco Masculino', 1);
call insProva('Lançamento do Dardo', 1);
call insProva('Lançamento do Dardo Feminino', 1);
call insProva('Lançamento do Disco Feminino', 1);
call insProva('Lançamento do Disco Masculino', 1);
call insProva('Lançamento do Martelo Masculino', 1);
call insProva('Maratona Feminina', 1);
call insProva('Maratona Masculina', 1);
call insProva('Marcha Atletica Masculina 20km', 1);
call insProva('Marcha Atlética 20 Km Feminino', 1);
call insProva('Marcha Atlética 20 Km Masculino', 1);
call insProva('Marcha Atlética 50 Km Masculino', 1);
call insProva('Marcha Atlética Feminino 20km', 1);
call insProva('Pentatlo Feminino', 1);
call insProva('Revezamento 4 x 100m Feminino', 1);
call insProva('Revezamento 4 x 100m Masculino', 1);
call insProva('Revezamento 4 x 400 Masculino', 1);
call insProva('Revezamento 4 x 400m Feminino', 1);
call insProva('Revezamento 4 x 400m Masculino', 1);
call insProva('Revezamento 4 x 400m Misto', 1);
call insProva('Revezamento Marcha Atlética Misto', 1);
call insProva('Revezametno 4 x 400m Masculino', 1);
call insProva('Salto Triplo Feminino', 1);
call insProva('Salto Triplo Masculino', 1);
call insProva('Salto com Vara Feminino', 1);
call insProva('Salto com Vara Masculino', 1);
call insProva('Salto em Altura Feminino', 1);
call insProva('Salto em Altura Masculino', 1);
call insProva('Salto em Distância Feminino', 1);
call insProva('Salto em Distância Masculino', 1);

call insProva('100m Borboleta Feminino', 2);
call insProva('100m Borboleta Masculino', 2);
call insProva('100m Costas Feminino', 2);
call insProva('100m Costas Masculino', 2);
call insProva('100m Livre Feminino', 2);
call insProva('100m Livre Masculino', 2);
call insProva('100m Nado Livre Masculino', 2);
call insProva('100m Peito Feminino', 2);
call insProva('100m Peito Masculino', 2);
call insProva('1500m Livre Feminino', 2);
call insProva('1500m Livre Masculino', 2);
call insProva('1500m Nado Livre', 2);
call insProva('200m Borboleta Feminino', 2);
call insProva('200m Borboleta Masculino', 2);
call insProva('200m Costas Masculino', 2);
call insProva('200m Livre Feminino', 2);
call insProva('200m Livre Masculino', 2);
call insProva('200m Medley Feminino', 2);
call insProva('200m Medley Masculino', 2);
call insProva('200m Nado Livre', 2);
call insProva('200m Nado Livre Masculino', 2);
call insProva('200m Peito Feminino', 2);
call insProva('200m Peito Masculino', 2);
call insProva('400m Livre Feminino', 2);
call insProva('400m Livre Masculino', 2);
call insProva('400m Medley Feminino', 2);
call insProva('400m Medley Masculino', 2);
call insProva('400m Nado Livre Feminino', 2);
call insProva('400m Nado Livre Masculino', 2);
call insProva('50m Livre Feminino', 2);
call insProva('50m Livre Masculino', 2);
call insProva('800m Livre Feminino', 2);
call insProva('800m Livre Masculino', 2);
call insProva('800m Nado Livre Feminino', 2);
call insProva('800m Nado Livre Natação', 2);
call insProva('Mixed 4 x 100m Medley Relay', 2);
call insProva('Revezamento 4 x 100m Nado Livre Masculino', 2);
call insProva('Revezamento 4 x 200m Nado Livre Masculino', 2);
call insProva('Revezamento 4x100m Livre Feminino', 2);
call insProva('Revezamento 4x100m Livre Masculino', 2);
call insProva('Revezamento 4x100m Medley Feminino', 2);
call insProva('Revezamento 4x100m Medley Masculino', 2);
call insProva('Revezamento 4x100m Medley Misto', 2);
call insProva('Revezamento 4x100m Nado Livre Feminino', 2);
call insProva('Revezamento 4x200m Livre Feminino', 2);
call insProva('Revezamento 4x200m Livre Masculino', 2);
call insProva('Revezamento 4x200m Nado Livre Feminino', 2);			

call insProva('Masculino', 3); 
call insProva('Feminino', 3); 
call insProva('Masculino', 4); 
call insProva('Feminino', 4);

-- sem inner join
select Provas.nomeProva as 'Prova', Modalidades.nomeModalidade as 'Modalidade' from provas, modalidades where Modalidades.codModalidade = Provas.codModalidade;

-- inner join
select Provas.nomeProva as 'Prova', Modalidades.nomeModalidade as 'Modalidade' from provas inner join Modalidades on Modalidades.codModalidade = Provas.codModalidade;

create table Estados(
codEstado int primary key auto_increment,
nomeEstado varchar(255) not null
);

create table Cidades(
codCidade int primary key auto_increment,
nomeCidade varchar(255) not null,
codEstado int
);

alter table Cidades add constraint fkCidCodEst foreign key(codEstado) references Estados(codEstado);

delimiter $$
create procedure insEstado(nome varchar(255))
begin
	if not exists (select nomeEstado from Estados where nomeEstado = nome) then
		insert into Estados (nomeEstado) values (nome);	
	end if;    
end;
$$

call insEstado('Acre');
call insEstado('Alagoas');
call insEstado('Alemanha');
call insEstado('Amapá');
call insEstado('Amazonas');
call insEstado('Argentina');
call insEstado('Armênia');
call insEstado('Austrália');
call insEstado('Bahia');
call insEstado('Bielorussia');
call insEstado('Bélgica');
call insEstado('Ceará');
call insEstado('China');
call insEstado('Colômbia');
call insEstado('Croácia');
call insEstado('Cuba');
call insEstado('Distrito Federal');
call insEstado('EUA');
call insEstado('Espanha');
call insEstado('Espírito Santo');
call insEstado('França');
call insEstado('Goiás');
call insEstado('Grã-Bretanha');
call insEstado('Holanda');
call insEstado('Hungria');
call insEstado('Inglaterra');
call insEstado('Itália');
call insEstado('Japão');
call insEstado('Lituânia');
call insEstado('Maranhão');
call insEstado('Mato Grosso');
call insEstado('Mato Grosso do Sul');
call insEstado('Minas Gerais');
call insEstado('Paraná');
call insEstado('Paraíba');
call insEstado('Pará');
call insEstado('Pernambuco');
call insEstado('Piauí');
call insEstado('Polônia');
call insEstado('Portugal');
call insEstado('Rio Grande do Norte');
call insEstado('Rio Grande do Sul');
call insEstado('Rio de Janeiro');
call insEstado('Rondônia');
call insEstado('Roraima');
call insEstado('Santa Catarina');
call insEstado('Sergipe');
call insEstado('Suiça');
call insEstado('Suécia');
call insEstado('São Paulo');
call insEstado('Sérvia');
call insEstado('Uruguai');
call insEstado('nan');

delimiter $$
create procedure insCidade(nome varchar(255), codEst int)
begin
	if not exists (select nomeCidade from Cidades where nomeCidade = nome and codEstado = codEst) then
		insert into Cidades (nomeCidade, codEstado) values (nome, codEst);	
	end if;    
end;
$$

call insCidade('?', 50);
call insCidade('Adamantina', 50);
call insCidade('Aguaí', 50);
call insCidade('Americana', 50);
call insCidade('Amparo', 50);
call insCidade('Andradina', 50);
call insCidade('Araraquara', 50);
call insCidade('Araras', 50);
call insCidade('Araçatuba', 50);
call insCidade('Artur Nogueira', 50);
call insCidade('Arujá', 50);
call insCidade('Atibaia', 50);
call insCidade('Bastos', 50);
call insCidade('Barra Bonita', 50);
call insCidade('Barueri', 50);
call insCidade('Bauru', 50);
call insCidade('Boa Esperança do Sul', 50);
call insCidade('Botucatu', 50);
call insCidade('Brasília', 50);
call insCidade('CAMPINAS', 50);
call insCidade('Caieiras', 50);
call insCidade('Campinas', 50);
call insCidade('Campo Limpo Paulista', 50);
call insCidade('Campos do Jordão', 50);
call insCidade('Capivari', 50);
call insCidade('Capão Bonito', 50);
call insCidade('Caraguatatuba', 50);
call insCidade('Carapicuíba', 50);
call insCidade('Casa Branca', 50);
call insCidade('Catanduva', 50);
call insCidade('Colina', 50);
call insCidade('Conchal', 50);
call insCidade('Coronel Macedo', 50);
call insCidade('Cosmopólis', 50);
call insCidade('Cotia', 50);
call insCidade('Cruzeiro', 50);
call insCidade('Cubatão', 50);
call insCidade('Descalvado', 50);
call insCidade('Diadema', 50);
call insCidade('Dracena', 50);
call insCidade('Ferraz de Vasconcelos', 50);
call insCidade('Franca', 50);
call insCidade('Garça', 50);
call insCidade('Guararapes', 50);
call insCidade('Guaratinguetá', 50);
call insCidade('Guarujá', 50);
call insCidade('Guarulhos', 50);
call insCidade('Guaíra', 50);
call insCidade('Itariri', 50);
call insCidade('Itu', 50);
call insCidade('Ibirá', 50);
call insCidade('Ibitinga', 50);
call insCidade('Iguape', 50);
call insCidade('Ilha Solteira', 50);
call insCidade('Ilhabela', 50);
call insCidade('Indiaporã', 50);
call insCidade('Ipaussu', 50);
call insCidade('Itanhaém', 50);
call insCidade('Itapeva', 50);
call insCidade('Itatiba', 50);
call insCidade('Itu', 50);
call insCidade('Ituverava', 50);
call insCidade('Jacareí', 50);
call insCidade('Jandira', 50);
call insCidade('Jaú', 50);
call insCidade('Jundiaí', 50);
call insCidade('Juquiá', 50);
call insCidade('Leme', 50);
call insCidade('Lençóis Paulista', 50);
call insCidade('Limeira', 50);
call insCidade('Lins', 50);
call insCidade('Lorena', 50);
call insCidade('Lucélia', 50);
call insCidade('Marília', 50);
call insCidade('Matão', 50);
call insCidade('Mauá', 50);
call insCidade('Mococa', 50);
call insCidade('Mogi das Cruzes', 50);
call insCidade('Morungaba', 50);
call insCidade('Nova Odessa', 50);
call insCidade('Orlândia', 50);
call insCidade('Osasco', 50);
call insCidade('Osvaldo Cruz', 50);
call insCidade('Pacaembu', 50);
call insCidade('Paraguaçu Paulista', 50);
call insCidade('Parapuã', 50);
call insCidade('Pariquera-Açu', 50);
call insCidade('Patrocinio Paulista', 50);
call insCidade('Pedregulho', 50);
call insCidade('Pedro de Toledo', 50);
call insCidade('Penápolis', 50);
call insCidade('Peruíbe', 50);
call insCidade('Pindamonhangaba', 50);
call insCidade('Piracicaba', 50);
call insCidade('Piraju', 50);
call insCidade('Pirassununga', 50);
call insCidade('Porto Ferreira', 50);
call insCidade('Potirendaba', 50);
call insCidade('Praia Grande', 50);
call insCidade('Presidente Prudente', 50);
call insCidade('Promissão', 50);
call insCidade('Quintana', 50);
call insCidade('Registro', 50);
call insCidade('Ribeirão Preto', 50);
call insCidade('Rio Claro', 50);
call insCidade('Rio de Janeiro', 50);
call insCidade('Rosárial', 50);
call insCidade('Rubineia', 50);
call insCidade('Salto', 50);
call insCidade('Santa Bárbara d Oeste', 50);
call insCidade('Santa Maria da Serra', 50);
call insCidade('Santa Rita do Passa Quatro', 50);
call insCidade('Santo André', 50);
call insCidade('Santo Antônio de Posse', 50);
call insCidade('Santos', 50);
call insCidade('Saudades', 50);
call insCidade('Sertãozinho', 50);
call insCidade('Sorocaba', 50);
call insCidade('Sumaré', 50);
call insCidade('Suzano', 50);
call insCidade('São Bernardo do Campo', 50);
call insCidade('São Caetano do Sul', 50);
call insCidade('São Carlos', 50);
call insCidade('São Joaquim da Barra', 50);
call insCidade('São José do Rio Preto', 50);
call insCidade('São José dos Campos', 50);
call insCidade('São João da Boa Vista', 50);
call insCidade('São Manuel', 50);
call insCidade('São Paulo', 50);
call insCidade('São Roque', 50);
call insCidade('São Sebastião', 50);
call insCidade('São Vicente', 50);
call insCidade('Taubaté', 50);
call insCidade('Tietê', 50);
call insCidade('Tupi Paulista', 50);
call insCidade('Tupã', 50);
call insCidade('Ubatuba', 50);
call insCidade('Valinhos', 50);
call insCidade('Vinhedo', 50);
call insCidade('Vista Alegre do Alto', 50);
call insCidade('Votorantim', 50);
call insCidade('Álvares Machado', 50);

create table Edicoes(
  codEdicao int primary key auto_increment,
  ano int,
  sede varchar(30)
);

create table Atletas(
codAtleta int primary key auto_increment,
nomeAtleta varchar(255),
dataNascimento varchar(20),
sexo char(1),
altura decimal(5,2) default null,
peso decimal(5,2) default null,
codCidade int
);

-- select * from Atletas;

create table ResultadosAtletas(
codAtletaRes int primary key auto_increment,
codAtleta int,
codProva int,
codEdicao int,
resultado varchar(255) default null,
medalha varchar(255) default null
);

alter table Atletas add constraint fkAtlCodCid foreign key(codCidade) references Cidades(codCidade);
alter table ResultadosAtletas add constraint fkResAtlCodAtl foreign key(codAtleta) references Atletas(codAtleta);
alter table ResultadosAtletas add constraint fkResAtlCodProv foreign key(codProva) references Provas(codProva);
alter table ResultadosAtletas add constraint fkResAtlCodEdi foreign key(codEdicao) references Edicoes(codEdicao);

delimiter $$
create procedure insEdicao(anoEdi int, sedeEdi varchar(30))
begin
	if not exists (select ano from Edicoes where ano = anoEdi) then
		insert into Edicoes (ano, sede) values (anoEdi, sedeEdi);	
	end if;    
end;
$$

call insEdicao(1900, 'Paris');
call insEdicao(1920, 'Antuérpia');
call insEdicao(1924, 'Paris');
call insEdicao(1932, 'Los Angeles');
call insEdicao(1936, 'Berlim');
call insEdicao(1948, 'Londres');
call insEdicao(1952, 'Helsinque');
call insEdicao(1956, 'Melbourne');
call insEdicao(1960, 'Roma');
call insEdicao(1964, 'Tóquio');
call insEdicao(1968, 'Cidade do México');
call insEdicao(1972, 'Munique');
call insEdicao(1976, 'Montreal');
call insEdicao(1980, 'Moscou');
call insEdicao(1984, 'Los Angeles');
call insEdicao(1988, 'Seul');
call insEdicao(1992, 'Barcelona');
call insEdicao(1996, 'Atlanta');
call insEdicao(2000, 'Sydney');
call insEdicao(2004, 'Atenas');
call insEdicao(2008, 'Pequim');
call insEdicao(2012, 'Londres');
call insEdicao(2016, 'Rio de Janeiro');
call insEdicao(2020, 'Tóquio');
call insEdicao(2024, 'Paris');
call insEdicao(2028, 'Los Angeles');
call insEdicao(2032, 'Brisbane');

-- select * from Provas where codModalidade = 1;
-- select * from Edicoes;

delimiter $$
create procedure insAtleta(nome varchar(255), dataNasc varchar(20), sexoAtl char(1), alturaAtl decimal(5,2), pesoAtl decimal(5,2), codCid int)
begin
	if not exists (select nome from Atletas where nomeAtleta = nome and dataNascimento = dataNasc) then
		insert into Atletas (nomeAtleta, dataNascimento, sexo, altura, peso, codCidade) values (nome, dataNasc, sexoAtl, alturaAtl, pesoAtl, codCid);	
	end if;    
end;
$$

call insAtleta('Adhemar Ferreira da Silva', '1927-09-29', 'M', null, null, 127);
call insAtleta('Aderval Luiz Arvani', '1949-01-07', 'M', null, null, 127);
call insAtleta('Stephanie Balduccini', '2004-09-20', 'F', null, null, 127);
call insAtleta('Thaissa Barbosa Presti', '1988-04-26', 'F', null, null, 127);
call insAtleta('Wanda dos Santos', '1932-06-01', 'F', null, null, 127);
call insAtleta('Manuel dos Santos Filho', '1939-02-22', 'M', null, null,127);
call insAtleta('Marcelo Teles Negrão', '1972-10-10', 'M', null, null, 127);
call insAtleta('Fofão', '1970-03-10', 'F', null, null, 127);

delimiter $$
create procedure insResA(codA int, codP int, codEdi int, res varchar(255), in med varchar(255))
begin
	if med = null then
		if not exists (select codAtletaRes from ResultadosAtletas where codAtleta = codA and codProva = codP and codEdicao = codEdi) then
			insert into ResultadosAtletas (codAtleta, codProva, codEdicao, resultado) values (codA, codP, codEdi, res);	
		end if;
    else
		if not exists (select codAtletaRes from ResultadosAtletas where codAtleta = codA and codProva = codP and codEdicao = codEdi) then
			insert into ResultadosAtletas (codAtleta, codProva, codEdicao, resultado, medalha) values (codA, codP, codEdi, res, med);	
            end if;
	end if;
end;
$$

call insResA(8, 111, 17, '4º lugar', null);
call insResA(8, 111, 18, '3º lugar', 'Bronze');
call insResA(8, 111, 19, '3º lugar', 'Bronze'); 
call insResA(8, 111, 20, '4º lugar', null);
call insResA(8, 111, 21, '4º lugar', 'Ouro');

call insResA(1, 56, 6, '8º lugar', null);
call insResA(1, 56, 7, '1º lugar', 'Ouro');
call insResA(1, 56, 8, '1º lugar', 'Ouro');
call insResA(1, 56, 9, '14º lugar', null);

call insResA(3, 105, 9, 'Eliminada na primeira fase', null);
call insResA(3, 101, 9, 'Eliminada na primeira fase', null);
call insResA(3, 109, 9, '7º lugar', null);
call insResA(3, 98, 9, 'Eliminada nas preliminares', null);
call insResA(3, 106, 9, 'Eliminada nas preliminares', null);

-- Exercício

insert into Modalidades (nomeModalidade) values ('Ginástica Artística');

call insProva('Individual All-Around Feminino', 5);
call insProva('Equipes Feminino', 5);
call insProva('Solo Feminino', 5);
call insProva('Barras Assimétricas Feminino', 5);
call insProva('Trave de Equilíbrio Feminino', 5);
call insProva('Salto sobre a mesa Feminino', 5);
call insProva('Individual Geral Feminino', 5);

call insAtleta('Rebeca Rodrigues de Andrade', '1999-09-29', 'F', null, null, 46);

call insResA(9, 114, 23, '11º lugar', null);
call insResA(9, 115, 23, '8º lugar', null);
call insResA(9, 116, 23, 'Não se classificou para a final', null);
call insResA(9, 117, 23, 'Não se classificou para a final', null);
call insResA(9, 118, 23, 'Não se classificou para a final', null);
call insResA(9, 117, 24, 'Não se classificou para a final', null);
call insResA(9, 119, 24, '1º lugar', 'Ouro');
call insResA(9, 116, 24, '5º lugar', null);
call insResA(9, 114, 24, '2º lugar', 'Prata');
call insResA(9, 115, 25, '3º lugar', 'Bronze');
call insResA(9, 114, 25, '3º lugar', 'Prata');
call insResA(9, 116, 25, '1º lugar', 'Ouro');
call insResA(9, 119, 25, '2º lugar', 'Prata');
call insResA(9, 118, 25, '4º lugar', null);

select a.nomeAtleta as 'Nome do Atleta',
    a.dataNascimento as 'Data de Nascimento',
    c.nomeCidade as 'Cidade de Nascimento',
    e.nomeEstado as 'Estado de Nascimento',
    m.nomeModalidade as 'Nome da Modalidade',
    p.nomeProva as 'Nome da Prova',
    ra.resultado as Resultado,
    ra.medalha as Medalha,
    ed.ano as 'Ano da Edição',
    ed.sede as Sede
from resultadosatletas ra
inner join atletas a on ra.codAtleta = a.codAtleta
inner join cidades c on a.codCidade = c.codCidade
inner join estados e on c.codEstado = e.codEstado
inner join provas p on ra.codProva = p.codProva
inner join modalidades m on p.codModalidade = m.codModalidade
inner join edicoes ed on ra.codEdicao = ed.codEdicao;

select distinct 
                                a.codAtleta, 
                                a.nomeAtleta, 
                                a.dataNascimento, 
                                a.sexo, 
                                a.codCidade,
                                m.codModalidade, 
                                m.nomeModalidade
                                from resultadosatletas r
                                join provas p on p.codProva = r.codProva
                                join atletas a on a.codAtleta = r.codAtleta
                                left join modalidades m on m.codModalidade = p.codModalidade
                                where r.codEdicao = 28;

-- atividade 07/08/2025

call insMod('Basquete');

call insProva('Basquete Feminino', 6);
call insProva('Vôlei Feminino', 3);

call insAtleta('Adriana "Adrianinha" Moisés Pinto', '1978-12-06', 'F', null, null, 41);

call insResA(10, 121, 19, '3º Lugar', 'Bronze');
call insResA(10, 121, 20, '4º Lugar', null);
call insResA(10, 121, 21, '11º Lugar', null);
call insResA(10, 121, 22, '9º Lugar', null);
call insResA(10, 121, 23, '11º Lugar', null);

call insCidade('Porto Alegre', 42);

call insAtleta('Carolina "Carol" Dematini de Albuquerque', '1977-07-25', 'F', null, null, 141);

call insResA(11, 121, 21, '1º Lugar', 'Ouro');

call insAtleta('Fabiana "Fabi" Alvim de Oliveira', '1980-03-07', 'F', null, null, 104);

call insResA(12, 121, 21, '1º Lugar', 'Ouro');
call insResA(12, 121, 22, '1º Lugar', 'Ouro');

call insCidade('Belo Horizonte', 33);

call insAtleta('Fabiana Marcelino Claudino', '1985-01-24', 'F', null, null, 142);

call insResA(13, 121, 20, '4º Lugar', null);
call insResA(13, 121, 21, '1º Lugar', 'Ouro');
call insResA(13, 121, 22, '1º Lugar', 'Ouro');
call insResA(13, 121, 23, '5º Lugar', null);

-- create procedure insAtleta(nome varchar(255), dataNasc varchar(20), sexoAtl char(1), alturaAtl decimal(5,2), pesoAtl decimal(5,2), codCid int)
-- create procedure insResA(codA int, codP int, codEdi int, res varchar(255), in med varchar(255))
-- select * from Atletas where dataNascimento = '15/05/1987';
-- select * from Edicoes;
-- select * from Modalidades;
-- select * from Estados where nomeEstado = 'Nauru';
-- describe ResultadosAtletas;
-- describe Atletas;
-- describe Cidades;
-- select * from Provas where codModalidade = 6;
-- select * from Cidades where nomeCidade = 'Belo Horizonte';
-- select * from Provas where codModalidade = 6;
-- select * from ResultadosAtletas where codAtleta = 7;