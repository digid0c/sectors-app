--liquibase formatted sql

--changeset digid0c:create_person_sector_table logicalFilePath:db/changelog/changes/30
DROP TABLE IF EXISTS person_sector CASCADE;

CREATE TABLE person_sector
(
    person_id   BIGINT   NOT NULL,
    sector_id   BIGINT   NOT NULL,
    PRIMARY KEY (person_id, sector_id)
);
--rollback drop table person_sector cascade;

--changeset digid0c:create_person_sector_table_person_table_fk logicalFilePath:db/changelog/changes/30
ALTER TABLE person_sector
ADD CONSTRAINT fk_person_sector_person FOREIGN KEY (person_id) REFERENCES person (id) ON DELETE CASCADE ON UPDATE CASCADE;
--rollback alter table person_sector drop foreign key if exists fk_person_sector_person;

--changeset digid0c:create_person_sector_table_sector_table_fk logicalFilePath:db/changelog/changes/30
ALTER TABLE person_sector
ADD CONSTRAINT fk_person_sector_sector FOREIGN KEY (sector_id) REFERENCES sector (id) ON DELETE CASCADE ON UPDATE CASCADE;
--rollback alter table person_sector drop foreign key if exists fk_person_sector_sector;