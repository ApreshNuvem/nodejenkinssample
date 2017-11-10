	-- Table: public.leads

			-- DROP TABLE public.leads;

DO $$
BEGIN
IF NOT EXISTS(
       SELECT 1
	   FROM   information_schema.tables 
	   WHERE  table_schema = 'public'
	   AND    table_name = 'leads'
      )
THEN
			CREATE TABLE public.leads
			(
			  leadbuyer character(100), -- LeadBuyer
			  source character(100), -- SourceChannel
			  name character(100),
			  vendor character(100), -- Vendor
			  id serial primary key 
			)
			WITH (
			  OIDS=TRUE
			);
						
END IF;
END
$$;



