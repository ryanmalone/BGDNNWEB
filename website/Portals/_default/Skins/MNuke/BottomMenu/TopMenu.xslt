<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html"/>
  <xsl:template match="/*">
    <xsl:apply-templates select="root" />
  </xsl:template>
  <xsl:template match="root">
    <ul class="manu" id="mj-main">
      <xsl:apply-templates select="node" />
    </ul>
  </xsl:template>
  <xsl:template match="node">
    <li >
   
      <xsl:choose>
        <xsl:when test="@enabled = 1">
          <a href="{@url}"  class="">
          
          
         
            <xsl:value-of select="@text" />
         
          </a>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="@text" />
        </xsl:otherwise>
      </xsl:choose>
    
        
     
    </li>
  </xsl:template>
</xsl:stylesheet>
