drop database if exists mlr1;

create database if not exists mlr1;
use mlr1;
# -----------------------------------------------------------------------------
#       table : etudiant
# -----------------------------------------------------------------------------

create table if not exists etudiant
 (
   numcinetu char(32) not null  ,
   nometu char(32) not null  ,
   prenometu char(32) not null  ,
   datenaissance char(32) not null  ,
   adresseetu char(32) not null  ,
   ville char(32) not null  ,
   niveauetu char(32) not null  
   , primary key (numcinetu) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       table : session
# -----------------------------------------------------------------------------

create table if not exists session
 (
   codesess char(32) not null  ,
   codeform char(32) not null  ,
   nomsess char(32) not null  ,
   datedebut char(32) not null  ,
   datefin char(32) not null  
   , primary key (codesess) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       table : specialite
# -----------------------------------------------------------------------------

create table if not exists specialite
 (
   codespec char(32) not null  ,
   nomspec char(32) not null  ,
   descspec char(32) not null  
   , primary key (codespec) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       table : formation
# -----------------------------------------------------------------------------

create table if not exists formation
 (
   codeform char(32) not null  ,
   titreform char(32) not null  ,
   dureeform char(32) not null  ,
   prixform char(32) not null  
   , primary key (codeform) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       table : est_inscrit
# -----------------------------------------------------------------------------

create table if not exists est_inscrit
 (
   numcinetu char(32) not null  ,
   codesess char(32) not null  ,
   typecours char(32) null  
   , primary key (numcinetu,codesess) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       table : appartient
# -----------------------------------------------------------------------------

create table if not exists appartient
 (
   codespec char(32) not null  ,
   codeform char(32) not null  
   , primary key (codespec,codeform) 
 ) 
 comment = "";


# -----------------------------------------------------------------------------
#       creation des references de table
# -----------------------------------------------------------------------------


alter table session 
  add foreign key fk_session_formation (codeform)
      references formation (codeform) ;


alter table est_inscrit 
  add foreign key fk_est_inscrit_etudiant (numcinetu)
      references etudiant (numcinetu) ;


alter table est_inscrit 
  add foreign key fk_est_inscrit_session (codesess)
      references session (codesess) ;


alter table appartient 
  add foreign key fk_appartient_specialite (codespec)
      references specialite (codespec) ;


alter table appartient 
  add foreign key fk_appartient_formation (codeform)
      references formation (codeform) ;

