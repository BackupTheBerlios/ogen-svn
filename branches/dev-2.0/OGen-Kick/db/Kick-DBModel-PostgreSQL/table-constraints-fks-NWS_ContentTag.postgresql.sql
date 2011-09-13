ALTER TABLE "NWS_ContentTag"
  ADD CONSTRAINT "NWS_ContentTag_IFContent_fkey" FOREIGN KEY ("IFContent")
    REFERENCES "NWS_Content" ("IDContent") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "NWS_ContentTag_IFTag_fkey" FOREIGN KEY ("IFTag")
    REFERENCES "NWS_Tag" ("IDTag") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
;

