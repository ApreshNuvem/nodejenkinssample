
-- ---------------- beckermedia Database Start-------------------
-- DO $$BEGIN
-- 	IF NOT EXISTS( SELECT Catalog_Name FROM information_schema.schemata WHERE schema_name = 'public' and Catalog_Name='beckermedia'   )
-- 	THEN		
--  			CREATE DATABASE beckermedia;			
-- 		END IF;
--  END$$;
-- ---------------- beckermedia Database Start-------------------

---------------- 1 Organizations table Start-------------------

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='orgnizations')
	THEN
		CREATE TABLE orgnizations(orgid serial PRIMARY KEY);
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='orgnizations' and column_name='orgid'   )
	THEN
		ALTER TABLE public."orgnizations"    ADD COLUMN orgid serial PRIMARY KEY ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='orgnizations' and column_name='orgname'   )
	THEN
		ALTER TABLE public."orgnizations"    ADD COLUMN orgname  varchar(50) ;
	END IF;
END$$;

---------------- Organizations table End-------------------


----------------2  Client table Start-------------------

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='clients')
	THEN
		CREATE TABLE clients(clientid serial PRIMARY KEY);
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='clients' and column_name='clientid'   )
	THEN
		ALTER TABLE public."clients"    ADD COLUMN clientid serial PRIMARY KEY ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='clients' and column_name='orgid'   )
	THEN
		ALTER TABLE public."clients"    ADD COLUMN orgid   int REFERENCES orgnizations(orgid);
		--ALTER TABLE public."clients"  alter COLUMN orgid  REFERENCES  orgnizations(orgid) ;--EMP_ID         INT      references COMPANY6(ID)
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='clients' and column_name='clientname'   )
	THEN
		ALTER TABLE public."clients"    ADD COLUMN clientname  varchar(50) ;
	END IF;
END$$;

---------------- clients table End-------------------


----------------3  Vendor table Start-------------------

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='vendor')
	THEN
		CREATE TABLE vendor(vendorid serial PRIMARY KEY);
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='vendor' and column_name='vendorid'   )
	THEN
		ALTER TABLE public."vendor"    ADD COLUMN vendorid serial PRIMARY KEY ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='vendor' and column_name='vendorname'   )
	THEN
		ALTER TABLE public."vendor"    ADD COLUMN vendorname  varchar(50) ;
	END IF;
END$$;

---------------- Vendor table End-------------------

---------------- 4 Status Code table Start-------------------

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='statuscode')
	THEN
		CREATE TABLE statuscode(statusid serial PRIMARY KEY);
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='statuscode' and column_name='statusid'   )
	THEN
		ALTER TABLE public."statuscode"    ADD COLUMN statusid serial PRIMARY KEY ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='statuscode' and column_name='status'   )
	THEN
		ALTER TABLE public."statuscode"    ADD COLUMN status  varchar(50) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='statuscode' and column_name='description'   )
	THEN
		ALTER TABLE public."statuscode"    ADD COLUMN description  varchar(500) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='statuscode' and column_name='validationtype'   )
	THEN
		ALTER TABLE public."statuscode"    ADD COLUMN validationtype  varchar(500) ;
	END IF;
END$$;

---------------- Status Code table End-------------------


---------------- 5 Client Status Code table Start-------------------

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='clientstatuscode')
	THEN
		CREATE TABLE clientstatuscode(clientstatuscodeid serial PRIMARY KEY);
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='clientstatuscode' and column_name='clientstatuscodeid'   )
	THEN
		ALTER TABLE public."clientstatuscode"    ADD COLUMN clientstatuscodeid serial PRIMARY KEY ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='clientstatuscode' and column_name='statusid'   )
	THEN
		ALTER TABLE public."clientstatuscode"    ADD COLUMN statusid   int REFERENCES statuscode(statusid);
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='clientstatuscode' and column_name='clientid'   )
	THEN
		ALTER TABLE public."clientstatuscode"     ADD COLUMN clientid   int REFERENCES clients(clientid);
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='clientstatuscode' and column_name='status'   )
	THEN
		ALTER TABLE public."clientstatuscode"    ADD COLUMN status  varchar(50) ;
	END IF;
END$$;
DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='clientstatuscode' and column_name='description'   )
	THEN
		ALTER TABLE public."clientstatuscode"    ADD COLUMN description  varchar(500) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='clientstatuscode' and column_name='validationtype'   )
	THEN
		ALTER TABLE public."clientstatuscode"    ADD COLUMN validationtype  varchar(500) ;
	END IF;
END$$;


---------------- Client Status Code table End-------------------


----------------6  Schools table Start-------------------

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='schools')
	THEN
		CREATE TABLE schools(schoolid serial PRIMARY KEY);
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='schools' and column_name='schoolid'   )
	THEN
		ALTER TABLE public."schools"    ADD COLUMN schoolid serial PRIMARY KEY ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='schools' and column_name='campusname'   )
	THEN
		ALTER TABLE public."schools"    ADD COLUMN campusname  varchar(50) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='schools' and column_name='schoolname'   )
	THEN
		ALTER TABLE public."schools"    ADD COLUMN schoolname  varchar(50) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='schools' and column_name='clientid'   )
	THEN
		ALTER TABLE public."schools"     ADD COLUMN clientid   int REFERENCES clients(clientid);
	END IF;
END$$;

---------------- Schools table End-------------------

----------------7  Campus table Start-------------------

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='campus')
	THEN
		CREATE TABLE campus(campusid serial PRIMARY KEY);
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='campus' and column_name='campusid'   )
	THEN
		ALTER TABLE public."campus"    ADD COLUMN campusid serial PRIMARY KEY ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='campus' and column_name='campusname'   )
	THEN
		ALTER TABLE public."campus"    ADD COLUMN campusname  varchar(50) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='campus' and column_name='displayname'   )
	THEN
		ALTER TABLE public."campus"    ADD COLUMN displayname  varchar(50) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='campus' and column_name='schoolid'   )
	THEN
		ALTER TABLE public."campus"     ADD COLUMN schoolid   int REFERENCES schools(schoolid);
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='campus' and column_name='clientid'   )
	THEN
		ALTER TABLE public."campus"     ADD COLUMN clientid   int REFERENCES clients(clientid);
	END IF;
END$$;

---------------- Campus table End-------------------

----------------8  Zip Codes table Start-------------------

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='zipcodes')
	THEN
		CREATE TABLE zipcodes(zipcodeid serial PRIMARY KEY);
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='zipcodes' and column_name='zipcodeid'   )
	THEN
		ALTER TABLE public."zipcodes"    ADD COLUMN zipcodeid serial PRIMARY KEY ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='zipcodes' and column_name='campusid'   )
	THEN
		ALTER TABLE public."zipcodes"     ADD COLUMN campusid   int REFERENCES campus(campusid);
	END IF;
END$$;


DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='zipcodes' and column_name='zip'   )
	THEN
		ALTER TABLE public."zipcodes"    ADD COLUMN zip  varchar(50) ;
	END IF;
END$$;

---------------- Zip Codes table End-------------------


----------------9  Programs table Start-------------------

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='programs')
	THEN
		CREATE TABLE programs(programid serial PRIMARY KEY);
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='programs' and column_name='programid'   )
	THEN
		ALTER TABLE public."programs"    ADD COLUMN programid serial PRIMARY KEY ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='programs' and column_name='clientid'   )
	THEN
		ALTER TABLE public."programs"     ADD COLUMN clientid   int REFERENCES clients(clientid);
	END IF;
END$$;


DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='programs' and column_name='programname'   )
	THEN
		ALTER TABLE public."programs"    ADD COLUMN programname  varchar(50) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='programs' and column_name='degreetype'   )
	THEN
		ALTER TABLE public."programs"    ADD COLUMN degreetype  varchar(50) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='programs' and column_name='programgroup'   )
	THEN
		ALTER TABLE public."programs"    ADD COLUMN programgroup  varchar(50) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='programs' and column_name='acceptededucationlevel'   )
	THEN
		ALTER TABLE public."programs"    ADD COLUMN acceptededucationlevel  varchar(5) ;
	END IF;
END$$;

---------------- Programs table End-------------------


----------------10  Campus Programs table Start-------------------

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='campusprograms')
	THEN
		CREATE TABLE campusprograms(campusprogramsid serial PRIMARY KEY);
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='campusprograms' and column_name='campusprogramsid'   )
	THEN
		ALTER TABLE public."campusprograms"    ADD COLUMN campusprogramsid serial PRIMARY KEY ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='campusprograms' and column_name='campusid'   )
	THEN
		ALTER TABLE public."campusprograms"     ADD COLUMN campusid   int REFERENCES campus(campusid);
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='campusprograms' and column_name='programid'   )
	THEN
		ALTER TABLE public."campusprograms"     ADD COLUMN programid   int REFERENCES programs(programid);
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='campusprograms' and column_name='isactive'   )
	THEN
		ALTER TABLE public."campusprograms"    ADD COLUMN isactive  varchar(1) ;
	END IF;
END$$;

---------------- Campus Programs table End-------------------


----------------11  Client Vendor Programs table Start-------------------

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='clientvendor')
	THEN
		CREATE TABLE clientvendor(clientvendorid serial PRIMARY KEY);
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='clientvendor' and column_name='clientvendorid'   )
	THEN
		ALTER TABLE public."clientvendor"    ADD COLUMN clientvendorid serial PRIMARY KEY ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='clientvendor' and column_name='vendorid'   )
	THEN
		ALTER TABLE public."clientvendor"     ADD COLUMN vendorid   int REFERENCES vendor(vendorid);
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='clientvendor' and column_name='clientid'   )
	THEN
		ALTER TABLE public."clientvendor"     ADD COLUMN clientid   int REFERENCES clients(clientid);
	END IF;
END$$;

---------------- Client Vendor table End-------------------

---------------- 12 lead table Start-------------------

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads')
	THEN
		CREATE TABLE leads(leadid serial PRIMARY KEY);
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='leadid'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN leadid serial PRIMARY KEY ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='fname'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN fname  varchar(50) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='lname'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN lname  varchar(50) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='vendorid'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN vendorid  int references vendor(vendorid);
	END IF;
END$$;
DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='clientid'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN clientid  int references clients(clientid);
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='dayphone'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN dayphone  varchar(50) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='email'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN email  varchar(100) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='zip'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN zip   int references zipcodes(zipcodeid); 
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='gradyear'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN gradyear  varchar(100) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='educationallevel'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN educationallevel  varchar(100) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='curriculamid'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN curriculamid  int ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='consentverbiage'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN consentverbiage  varchar(100) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='address1'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN address1  varchar(100) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='address2'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN address2  varchar(100) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='city'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN city  varchar(50) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='stats'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN stats  varchar(50) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='country'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN country  varchar(50) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='evephone'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN evephone  varchar(12) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='timetocall'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN timetocall  varchar(50) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='dayevening'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN dayevening  varchar(50) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='howhear'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN howhear  varchar(50) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='referrerlastname'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN referrerlastname  varchar(50) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='leadbuyerid'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN leadbuyerid  varchar(50) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='friendfirstname'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN friendfirstname  varchar(50) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='friendlastname'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN friendlastname  varchar(50) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='frienddayphoe'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN frienddayphoe  varchar(12) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='friendzip'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN friendzip  varchar(10) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='friendemail'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN friendemail  varchar(50) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='vendorid'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN vendorid  int references vendor(vendorid); 
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='mscklidorgclid'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN mscklidorgclid  varchar(50) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='affilatetrackingcode'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN affilatetrackingcode  varchar(50) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='captureurl'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN captureurl  text ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='referingurl'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN referingurl  text ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='matchtype'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN matchtype  varchar(50) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='device'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN device  varchar(50) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='physicallocation'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN physicallocation  varchar(50) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='adposition'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN adposition  varchar(50) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='prospectip'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN prospectip  varchar(50) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='campaignname'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN campaignname  varchar(50) ;
	END IF;
END$$;


DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='keywords'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN keywords  varchar(50) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='istest'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN istest  varchar(1) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads' and column_name='status'   )
	THEN
		ALTER TABLE public."leads"    ADD COLUMN status  varchar(1) ;
	END IF;
END$$;


---------------- leads table End-------------------

------------------- Write function start -------------------
CREATE OR REPLACE FUNCTION public.ppl_ppc(
    p_fname character varying,
    p_lname character varying,
    p_vendor character varying,
    p_client character varying,
    p_dayphone character varying,
    p_email character varying,
    p_zip character varying,
    p_consentverbiage character varying,
    p_address1 character varying,
    p_city character varying,
    p_country character varying,
    p_orgname character varying,
    p_educationlevel character varying)
  RETURNS integer AS
$BODY$

declare d_orgid  integer;
declare d_clientid  integer;
declare d_vendorid  integer;
declare d_schoolid  integer;
declare d_campusid  integer;
declare d_zipid  integer;

    BEGIN
	--p_vendor 
	IF NOT EXISTS( SELECT vendorname FROM public.vendor WHERE vendorname=p_vendor  )
	THEN
		INSERT INTO public.vendor (vendorname) 
		VALUES (p_vendor); 
		
	END IF;
	EXECUTE 'SELECT max(vendorid) FROM public.vendor WHERE vendorname= $1'
	INTO d_vendorid
	USING p_vendor;
	--PERFORM d_vendorid= vendorid FROM public.vendor WHERE vendorname=p_vendor ;
	--p_orgname	
	IF NOT EXISTS( SELECT orgname FROM public.orgnizations WHERE orgname=p_orgname  )
	THEN
		INSERT INTO public.orgnizations (orgname) 
		VALUES (p_orgname); 
		
	END IF;
	EXECUTE 'SELECT max(orgid) FROM public.orgnizations WHERE orgname= $1'
	INTO d_orgid
	USING p_orgname;
	--PERFORM d_orgid= orgid FROM  public.orgnizations WHERE orgname=p_orgname ;
	--p_client	
	IF NOT EXISTS( SELECT clientname FROM public.clients WHERE clientname=p_client and orgid=d_orgid )
	THEN
		INSERT INTO public.clients (orgid,clientname) 
		VALUES (d_orgid,p_client); 
		
	END IF;
	EXECUTE 'SELECT max(clientid) FROM public.clients WHERE clientname= $1 and orgid=$2'
	INTO d_clientid
	USING p_client,d_orgid;
	--PERFORM d_clientid= clientid FROM  public.clients WHERE clientname=p_client and orgid=d_orgid  ;
	--p_School
	IF NOT EXISTS( SELECT schoolname FROM public.schools WHERE schoolname=p_educationlevel  and clientid= d_clientid)
	THEN
		INSERT INTO public.schools (campusname,schoolname,clientid) 
		VALUES (p_educationlevel,p_educationlevel,d_clientid); 
		
	END IF;
	--PERFORM d_schoolid= schoolid FROM  public.schools WHERE schoolname=p_educationlevel and clientid= d_clientid ;
	EXECUTE 'SELECT max(schoolid) FROM public.schools WHERE schoolname= $1 and clientid=$2'
	INTO d_schoolid
	USING p_educationlevel,d_clientid;
	--p_Campus
	IF NOT EXISTS( SELECT campusname FROM public.campus WHERE campusname=p_educationlevel and schoolid=  d_schoolid and clientid= d_clientid )
	THEN
		INSERT INTO public.campus (campusname,displayname,schoolid,clientid) 
		VALUES (p_educationlevel,p_educationlevel,d_schoolid,d_clientid); 
		
	END IF;
	--PERFORM d_campusid= campusid FROM  public.campus WHERE campusname=p_educationlevel and schoolid=  d_schoolid and clientid= d_clientid ;
	EXECUTE 'SELECT max(campusid) FROM public.campus WHERE campusname= $1 and schoolid=$2'
	INTO d_campusid
	USING p_educationlevel,d_schoolid;
	--p_zip	
	IF NOT EXISTS( SELECT zip FROM public.zipcodes WHERE zip=p_zip and campusid=d_campusid )
	THEN
		INSERT INTO public.zipcodes (campusid,zip) 
		VALUES (d_campusid,p_zip); 
		
	END IF;
	PERFORM d_zipid= zipcodeid FROM  public.zipcodes WHERE zip=p_zip and campusid=1  ;
    
    INSERT INTO public.leads (fname, lname,vendorid,clientid,dayphone,email,zip,consentverbiage,address1,city,country) 
    VALUES (p_fname,p_lname,d_vendorid,d_clientid,p_dayphone,p_email,d_zipid,p_consentverbiage,p_address1,p_city,p_country);
	-- INSERT INTO public.postdata (posttext, typeid) VALUES (p_post,p_typeid);
	-- PERFORM  p_post;
	-- CREATE TEMP TABLE temp1 AS
	-- select regexp_split_to_table(p_post,';');
	-- select * from p_post_arr;
	-- PERFORM  * from   temp1;
      RETURN  1;
    END;
    $BODY$
  LANGUAGE plpgsql VOLATILE;
 
 
 --------------- Write Function End ------------------------------------------------

 
 
 ----------------12  Client vs leads table Start-------------------

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='clientvsleadfields')
	THEN
		CREATE TABLE clientvsleadfields(clientvsleadfieldsid serial PRIMARY KEY);
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='clientvsleadfields' and column_name='clientvsleadfieldsid'   )
	THEN
		ALTER TABLE public."clientvsleadfields"    ADD COLUMN clientvsleadfieldsid serial PRIMARY KEY ;
	END IF;
END$$;


DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='clientvsleadfields' and column_name='clientid'   )
	THEN
		ALTER TABLE public."clientvsleadfields"     ADD COLUMN clientid   int REFERENCES clients(clientid);
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='clientvsleadfields' and column_name='leadcolname'   )
	THEN
		ALTER TABLE public."clientvsleadfields"     ADD COLUMN leadcolname   varchar(50) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='clientvsleadfields' and column_name='ppl'   )
	THEN
		ALTER TABLE public."clientvsleadfields"     ADD COLUMN ppl   boolean ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='clientvsleadfields' and column_name='pplreq'   )
	THEN
		ALTER TABLE public."clientvsleadfields"     ADD COLUMN pplreq   boolean ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='clientvsleadfields' and column_name='pplparam'   )
	THEN
		ALTER TABLE public."clientvsleadfields"     ADD COLUMN pplparam   varchar(50) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='clientvsleadfields' and column_name='ppc'   )
	THEN
		ALTER TABLE public."clientvsleadfields"     ADD COLUMN ppc   boolean ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='clientvsleadfields' and column_name='ppcreq'   )
	THEN
		ALTER TABLE public."clientvsleadfields"     ADD COLUMN ppcreq   boolean ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='clientvsleadfields' and column_name='ppcparam'   )
	THEN
		ALTER TABLE public."clientvsleadfields"     ADD COLUMN ppcparam   varchar(50) ;
	END IF;
END$$;

DO $$BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='clientvsleadfields' and column_name='statuscode'   )
	THEN
		ALTER TABLE public."clientvsleadfields"     ADD COLUMN statuscode   varchar(50) ;
	END IF;
END$$;

---------------- Client Vendor table End-------------------

------------- temp code for filling mastervalues -----------------------



DO $$BEGIN
DECLARE
    r information_schema.columns%rowtype;
    declare p_orgname varchar(50)='Becker Media';
    declare p_client varchar(50)='Hunter';
    declare d_orgid integer;
    declare d_clientid integer;
BEGIN
IF  EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='leads'    )
	THEN
	--p_orgname	
		IF NOT EXISTS( SELECT orgname FROM public.orgnizations WHERE orgname=p_orgname  )
		THEN
			INSERT INTO public.orgnizations (orgname) 
			VALUES (p_orgname); 

		END IF;
		--select d_orgid=  max(orgid) as d_orgid from public.orgnizations  WHERE orgname=p_orgname;    

			EXECUTE 'SELECT max(orgid) FROM public.orgnizations WHERE orgname = $1'
			INTO d_orgid
			USING p_orgname;
  
		 --d_orgid= 'select orgid FROM  public.orgnizations WHERE orgname='||p_orgname ;
		--p_client	
		IF NOT EXISTS( SELECT clientname FROM public.clients WHERE clientname=p_client and orgid=d_orgid )
		THEN
			INSERT INTO public.clients (orgid,clientname) 
			VALUES (d_orgid,p_client); 
			
		END IF;
		EXECUTE 'select clientid FROM  public.clients WHERE clientname=$1 and orgid=$2'
			INTO d_clientid
			USING p_client,d_orgid;
		-- d_clientid= 'select clientid FROM  public.clients WHERE clientname='||p_client 'and orgid='||d_orgid  ;
		FOR r IN SELECT * FROM information_schema.columns WHERE table_name='leads' and column_name<>'leadid'
		LOOP

		--p_ClientVeLead 
		IF NOT EXISTS( SELECT leadcolname FROM public.clientvsleadfields WHERE leadcolname=r.column_name and clientid=d_clientid  )
		THEN
			INSERT INTO public.clientvsleadfields (clientid,leadcolname,ppl,pplreq,pplparam,ppc,ppcreq,ppcparam) 
			VALUES (d_clientid,r.column_name,true,true,r.column_name,true,true,r.column_name); 
			
		END IF;
		-- can do some processing here
		PERFORM  r ;
		-- NEXT ; -- return current row of SELECT
		END LOOP;
  
	END IF;

	end;
END$$;
---------------temp code for filling mastervalues----------------------------
--select * from public.clientvsleadfields order by clientvsleadfieldsid;
update  public.clientvsleadfields set ppl=false,pplreq=false,ppc=false,ppcreq=false WHERE clientvsleadfieldsid>7;
update public.clientvsleadfields set pplparam='firstname',ppcparam='firstname',statuscode='SR-513' WHERE clientvsleadfieldsid=1;
update public.clientvsleadfields set pplparam='lastname',ppcparam='lastname',statuscode='SR-513' WHERE clientvsleadfieldsid=2;
update public.clientvsleadfields set pplparam='VendorID',ppcparam='VendorID',statuscode='SR-502' WHERE clientvsleadfieldsid=3;
update public.clientvsleadfields set pplparam='SourceChannel',ppcparam='SourceChannel',statuscode='SR-502' WHERE clientvsleadfieldsid=4;
update public.clientvsleadfields set pplparam='dayphone',ppcparam='dayphone' ,statuscode='SR-502'WHERE clientvsleadfieldsid=5;
update public.clientvsleadfields set pplparam='email',ppcparam='email',statuscode='SR-515' WHERE clientvsleadfieldsid=6;
update public.clientvsleadfields set pplparam='zip',ppcparam='zip' ,statuscode='SR-517'WHERE clientvsleadfieldsid=7;
update public.clientvsleadfields set pplparam='EducationLevel',ppcparam='EducationLevel',statuscode='SR-518' WHERE clientvsleadfieldsid=9;
update public.clientvsleadfields set pplparam='CurriculumID',ppcparam='CurriculumID',statuscode='SR-512' WHERE clientvsleadfieldsid=10;
update public.clientvsleadfields set pplparam='ConsentVerbiage',ppcparam='ConsentVerbiage' ,statuscode='SR-502'WHERE clientvsleadfieldsid=11;
update public.clientvsleadfields set pplparam='address',ppcparam='address',statuscode='SR-514' WHERE clientvsleadfieldsid=12;
update public.clientvsleadfields set pplparam='city',ppcparam='city',statuscode='SR-516' WHERE clientvsleadfieldsid=14;
update public.clientvsleadfields set pplparam='country',ppcparam='country',statuscode='SR-502' WHERE clientvsleadfieldsid=16;
update public.clientvsleadfields set pplparam='LeadBuyerID',ppcparam='LeadBuyerID' ,statuscode='SR-518'WHERE clientvsleadfieldsid=22;
--select * from clientvsleadfields,clients;
--select * from clientvsleadfields INNER JOIN clients on (clientvsleadfields.clientid=clients.clientid); --INNER JOIN cities ON (weather.city = cities.name);
--select * from clientvsleadfields left JOIN clients on (clientvsleadfields.clientid=clients.clientid);

--select * from public.leadcolumns('Hunter');
--DROP SCHEMA public CASCADE;
--CREATE SCHEMA public;
DROP FUNCTION leadfieldsbyclient;
------------------- Write function start -------------------
CREATE OR REPLACE FUNCTION public.leadfieldsbyclient(p_Client character varying)
  RETURNS Table(
	clientvsleadfieldsid integer,
	clientid integer,
	ppl boolean,
	pplreq boolean,
	pplparam varchar(50),
	ppc boolean,
	ppcreq boolean,
	ppcparam varchar(50)
	)  AS
$BODY$
    BEGIN
	
      RETURN  QUERY  select clientvsleadfields.clientvsleadfieldsid,clientvsleadfields.clientid,clientvsleadfields.ppl ,clientvsleadfields.pplreq,clientvsleadfields.pplparam,
      clientvsleadfields.ppc,clientvsleadfields.ppcreq,clientvsleadfields.ppcparam
      from clientvsleadfields INNER JOIN clients on (clientvsleadfields.clientid=clients.clientid) where clients.clientname=p_Client;
    END;
    $BODY$
  LANGUAGE plpgsql VOLATILE;







