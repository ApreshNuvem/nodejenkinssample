-- Table: public."user"

-- DROP TABLE public."user";

DO $$
BEGIN
IF NOT EXISTS(
       SELECT 1
	   FROM   information_schema.tables 
	   WHERE  table_schema = 'public'
	   AND    table_name = 'user'
      )
THEN
      
			CREATE TABLE public."user"
			(
				"userId" integer NOT NULL,
				"firstName" character(50) COLLATE pg_catalog."default",
				"lastName" character(50) COLLATE pg_catalog."default",
				CONSTRAINT user_pkey PRIMARY KEY ("userId")
			)
			WITH (
				OIDS = FALSE
			)
			TABLESPACE pg_default;
			
END IF;
END
$$;


-- ALTER TABLE public."user" DROP COLUMN phone;
-- 11/06/2017 Phone column added. 
DO $$
BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='user' and column_name='phone'   )
THEN
ALTER TABLE public."user"
    ADD COLUMN phone integer;
END IF;
END
$$;

-- 11/06/2017 email column added. 
DO $$
BEGIN
IF NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name='user' and column_name='email'   )
THEN
ALTER TABLE public."user"
    ADD COLUMN email character(255) ;
END IF;
END
$$;

