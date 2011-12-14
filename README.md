#ONE BLOG TO RULE THEM ALL__*__
###projekt grupy Tanczacy-z-Railsami

##Pomysł:
Stworzyć aplikację internatową, która zinegruje wiele źródeł informacji na temat 
jego właściciela. Docelowo aplikacja ma selektywnie zbierać informacje z szerokiej 
gamy portali/serwisów/stron internetowych/blogów jednocześnie pozwalając użytkownikowi
na konfigurację z jakich źródeł i jakie informacje mają się pojawić. Tj. użytkownik 
instalując na swoim blogu widget np. Twittera zgadza się na umieszczenie na min 
informacji na temat jego poczynań na Twitterze.

##Architektura:
Frontend ma opierać się na koncepcji widgetu, tj. użytkownik otrzyma do dyspozycji 
"sloty" (przypisane do jego konta w systemie) w których będzie mógł umieścić dodatki
rozszerzające funkcjonalność strony np. poprzez dodanie treści. W celu stworzenia 
możliwie jak najlżejszej i najbardziej wszechstronnej implementacji planujemy 
stworzenie najpierw ogólnego rozwiązania i opublikowanie go w postaci gemu. Konkretne
instancje widgetów mają bazować na nim. Do celów prezentacyjnych zastosowana będzie 
biblioteka jQuery także jQuery UI, JavaScript i Ajax. Jako baza danych wykorzystane 
będzie MongoDB. 
Potencjalnie także:
KendoUI, Solr, Flash, Flattr, JQuery Mobile, Salomon Protocol-Open Social-Activity Streams,
HTML5, CSS3, Saas, Modernizr, Selenium

##Deployment:
MongoLabs, OpenStack?

__*__ nazwa robocza

##Design:
Wygląd jest już prawie gotowy do pocięcia i wrzucenia do repo


(Link do surowej wersji)[https://lh5.googleusercontent.com/_yGavgIs4oW-rfcnEyyseEXUgNTVQDb9lXN5Mo8FGz4LiTMdlQ0FptZFeDbQWk_a4r3FxyW15HDLDlR6TtpAB_WpfG_5ZWTFtO1OyZiqNfUaryMhHfQ]


##Konfiguracja i uruchomienie

    bundle install
    rake db:migrate
    rake db:seed
    rails s

