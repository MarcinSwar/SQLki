# SQLki

CREATE TABLE Plec(
	id_plec serial PRIMARY KEY
	,plec varchar(10)
);

CREATE TABLE Marka(
	id_marka serial PRIMARY KEY
	,nazwa varchar(50)
);

CREATE TABLE Kategoria(
	id_kategoria integer PRIMARY KEY
	,nazwa varchar(13)
);	

CREATE TABLE Model(
	id_model serial PRIMARY KEY
	,id_marka integer REFERENCES Marka(id_marka)
	,id_plec integer REFERENCES Plec(id_plec)
	,id_kategoria integer REFERENCES Kategoria(id_kategoria)
	,nazwa varchar(50)
	,cena numeric(10, 2)
);

CREATE TABLE Kolor(
	id_kolor integer PRIMARY KEY
	,nazwa varchar(10)
);	
    
CREATE TABLE Produk(
	id_produkt serial PRIMARY KEY
	,id_model integer REFERENCES Model(id_model)
	,id_kolor integer REFERENCES Kolor(id_kolor)
	,rozmiar integer
	,ilosc integer
);
  
CREATE TABLE Rola_uzytkownik(
	id_rola serial PRIMARY KEY
	,rola varchar(30)
);  

CREATE TABLE adres(
	id_adres serial PRIMARY KEY
	,id_uzytkownik integer references Uzytkownik(id_uzytkownik)
	,ulica varchar(30)
	,kod_pocztowy varchar(30)
	,miasto varchar(30)

);

CREATE TABLE Uzytkownik(
	id_uzytkownik serial PRIMARY KEY
	,id_rola integer REFERENCES Rola_uzytkownik(id_rola)
	,imie varchar(30)
	,nazwisko varchar(30)
	,email varchar(30) UNIQUE NOT NULL
);

CREATE TABLE Faktura(				--
	id_faktura serial PRIMARY KEY
	,id_uzytkownik integer REFERENCES Uzytkownik(id_uzytkownik)
	,ulica varchar(30)
	,kod_pocztowy varchar(30)
	,miasto varchar(30)
	,nazwa_firmy varchar(30)
	,nip numeric(10)
	,nr_faktury varchar(30)
		
);

CREATE TABLE Forma_dostawy(
	id_forma_dostawy serial PRIMARY KEY
	,forma_dostawy varchar(30)
);

CREATE TABLE Forma_platnosci(
	id_forma_platnosci serial PRIMARY KEY
	,forma_platnosci varchar(30)
);

CREATE TABLE Status_zamowienia(
	id_status_zamowienia serial PRIMARY KEY
	,status varchar(30)
);

CREATE TABLE Zamowienia_produkty(
	id_zamowienia_produkty serial PRIMARY KEY
	,id_zamowienia integer REFERENCES Zamowienia(id_zamowienia)
	,id_produkt integer REFERENCES Produkt(id_produkt)
	,ilosc integer
	,cena nueric(10, 2)
);

CREATE TABLE kody_rabatowe(
	id_kody_rabatowe serial PRIMARY KEY
	,kod varchar(30)
	,wysokosc_rabatu varchar(30)
	,czy_uzyty boolean
);

  
CREATE TABLE Zamowienia(
  	id_zamowienia serial PRIMARY KEY
	,id_uzytkownik integer REFERENCES Uzytkownik(id_uzytkownik)
	,id_status_zamowienia integer REFERENCES Status_zamowienia(id_status_zamowienia)
	,id_forma_dostawy integer REFERENCES Forma_dostawy(id_forma_dostawy)
	,id_forma_platnosci integer REFERENCES Forma_platnosci(id_forma_platnosci)
	,id_faktura integer REFERENCES Faktura(id_faktura)
	,id_adres_zamowienia REFERENCES Adres(id_adres)
	,id_adres_dostawy REFERENCES Adres(id_adres)
	,id_kody_rabatowe integer REFERENCES Kody_rabatowe(id_kody_rabatowe)
	,data_zamowienia date not null
	,data_wysylki date
	,wartosc numeric(10, 2)
);

	
  
  
