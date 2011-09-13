ALTER TABLE "NWS_ContentSource"
  ADD CONSTRAINT "NWS_ContentSource_IFContent_fkey" FOREIGN KEY ("IFContent")
    REFERENCES "NWS_Content" ("IDContent") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "NWS_ContentSource_IFSource_fkey" FOREIGN KEY ("IFSource")
    REFERENCES "NWS_Source" ("IDSource") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
;

