CREATE TABLE public.Country (
                countryId INTEGER NOT NULL,
                countryName VARCHAR NOT NULL,
                CONSTRAINT countryid PRIMARY KEY (countryId)
);


CREATE TABLE public.City (
                cityId INTEGER NOT NULL,
                countryId INTEGER NOT NULL,
                cityName VARCHAR NOT NULL,
                CONSTRAINT cityid PRIMARY KEY (cityId)
);


CREATE TABLE public.Street (
                streetId INTEGER NOT NULL,
                cityId INTEGER NOT NULL,
                streetName VARCHAR NOT NULL,
                CONSTRAINT streetid PRIMARY KEY (streetId)
);


CREATE TABLE public.Status (
                statusId INTEGER NOT NULL,
                statusName VARCHAR NOT NULL,
                CONSTRAINT statusid PRIMARY KEY (statusId)
);


CREATE TABLE public.HouseType (
                houseTypeId INTEGER NOT NULL,
                houseTypeName VARCHAR NOT NULL,
                description VARCHAR NOT NULL,
                CONSTRAINT housetypeid PRIMARY KEY (houseTypeId)
);


CREATE TABLE public.Apartment (
                apartmentId INTEGER NOT NULL,
                streetId INTEGER NOT NULL,
                houseTypeId INTEGER NOT NULL,
                houseNumber VARCHAR NOT NULL,
                apartmentNumber INTEGER NOT NULL,
                floor INTEGER NOT NULL,
                roomCount INTEGER NOT NULL,
                CONSTRAINT apartmentid PRIMARY KEY (apartmentId)
);


CREATE TABLE public.Seller (
                sellerId VARCHAR NOT NULL,
                sellerName VARCHAR NOT NULL,
                CONSTRAINT sellerid PRIMARY KEY (sellerId)
);


CREATE TABLE public.Buyer (
                buyerId VARCHAR NOT NULL,
                buyerName VARCHAR NOT NULL,
                CONSTRAINT buyerid PRIMARY KEY (buyerId)
);


CREATE TABLE public.Agency (
                agencyId INTEGER NOT NULL,
                agencyName VARCHAR NOT NULL,
                CONSTRAINT agencyid PRIMARY KEY (agencyId)
);


CREATE TABLE public.Branch (
                branchId INTEGER NOT NULL,
                streetId INTEGER NOT NULL,
                agencyId INTEGER NOT NULL,
                CONSTRAINT branchid PRIMARY KEY (branchId)
);


CREATE TABLE public.Agent (
                agentId INTEGER NOT NULL,
                branchId INTEGER NOT NULL,
                agentName VARCHAR NOT NULL,
                getPosDate DATE NOT NULL,
                CONSTRAINT agentid PRIMARY KEY (agentId)
);


CREATE TABLE public.Offer (
                offerId INTEGER NOT NULL,
                apartmentId INTEGER NOT NULL,
                sellerId VARCHAR NOT NULL,
                agentId INTEGER NOT NULL,
                apartment INTEGER NOT NULL,
                minPrice REAL NOT NULL,
                wishes VARCHAR NOT NULL,
                topicality BOOLEAN NOT NULL,
                CONSTRAINT offerid PRIMARY KEY (offerId)
);


CREATE TABLE public.Demand (
                demandId INTEGER NOT NULL,
                buyerId VARCHAR NOT NULL,
                agentId INTEGER NOT NULL,
                maxPrice REAL NOT NULL,
                wishes VARCHAR NOT NULL,
                topicality BOOLEAN NOT NULL,
                CONSTRAINT demandid PRIMARY KEY (demandId)
);


CREATE TABLE public.Deal (
                demandId INTEGER NOT NULL,
                offerId INTEGER NOT NULL,
                statusId INTEGER NOT NULL,
                CONSTRAINT dealid PRIMARY KEY (demandId, offerId)
);


ALTER TABLE public.City ADD CONSTRAINT country_city_fk
FOREIGN KEY (countryId)
REFERENCES public.Country (countryId)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Street ADD CONSTRAINT city_street_fk
FOREIGN KEY (cityId)
REFERENCES public.City (cityId)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Apartment ADD CONSTRAINT street_apartment_fk
FOREIGN KEY (streetId)
REFERENCES public.Street (streetId)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Branch ADD CONSTRAINT street_branch_fk
FOREIGN KEY (streetId)
REFERENCES public.Street (streetId)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Deal ADD CONSTRAINT status_deal_fk
FOREIGN KEY (statusId)
REFERENCES public.Status (statusId)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Apartment ADD CONSTRAINT housetype_apartment_fk
FOREIGN KEY (houseTypeId)
REFERENCES public.HouseType (houseTypeId)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Offer ADD CONSTRAINT apartment_offer_fk
FOREIGN KEY (apartmentId)
REFERENCES public.Apartment (apartmentId)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Offer ADD CONSTRAINT seller_offer_fk
FOREIGN KEY (sellerId)
REFERENCES public.Seller (sellerId)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Demand ADD CONSTRAINT buyer_demand_fk
FOREIGN KEY (buyerId)
REFERENCES public.Buyer (buyerId)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Branch ADD CONSTRAINT agency_branch_fk
FOREIGN KEY (agencyId)
REFERENCES public.Agency (agencyId)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Agent ADD CONSTRAINT branch_agent_fk
FOREIGN KEY (branchId)
REFERENCES public.Branch (branchId)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Demand ADD CONSTRAINT agent_demand_fk
FOREIGN KEY (agentId)
REFERENCES public.Agent (agentId)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Offer ADD CONSTRAINT agent_offer_fk
FOREIGN KEY (agentId)
REFERENCES public.Agent (agentId)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Deal ADD CONSTRAINT offer_deal_fk
FOREIGN KEY (offerId)
REFERENCES public.Offer (offerId)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Deal ADD CONSTRAINT demand_deal_fk
FOREIGN KEY (demandId)
REFERENCES public.Demand (demandId)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--------------------------------------------------------------------------------

insert into Agency (agencyId, agencyName)
values (1, 'Агентство1'), (2, 'Агентство2'), (3, 'Агентство3');

select * from Agency;

select agencyName
from Agency
where agencyId = 2;
