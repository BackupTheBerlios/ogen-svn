<?xml version="1.0" encoding="UTF-8" ?>

<!-- Summary:  !-->
<!-- Created: !-->
<!-- TODO: !-->

<!--Required header !-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" encoding="UTF-8" indent="yes" />
<xsl:preserve-space elements="*" />

<xsl:param name="TableName" />

<xsl:template match="/metadata/tables">
<xsl:apply-templates select="table[@name=$TableName]" />
</xsl:template>

<xsl:template match="table">
--- <xsl:value-of select="$TableName" />:
<xsl:for-each select="fields"><xsl:for-each select="field">
<xsl:value-of select="@name" />, <xsl:value-of select="@type" />
</xsl:for-each></xsl:for-each>
---
</xsl:template>

</xsl:stylesheet>