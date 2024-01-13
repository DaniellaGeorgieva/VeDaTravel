<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:ns="http://www.w3schools.com" 
                xmlns:xlink="http://www.w3.org/1999/xlink">
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="design.css"/>
                <title>Каталог на екскурзии</title>
                <script src="scripts/script.js" defer="defer"></script>
                <script src="scripts/dateSort.js" defer="defer"></script>
                <script src="scripts/priceSort.js" defer="defer"></script>
                <script src="scripts/displayText.js" defer="defer"></script>
            </head>
            <body>
                <div class="container">
                    <h1><img class="logo" src="logo.png"/> Каталог на екскурзии</h1>
                    <table id="myTable">
                        <tr>
                            <th onclick="sortTable(0)">Дестинация</th>
                            <th onclick="dateSort(1)">Дата отиване</th>
                            <th onclick="dateSort(2)">Дата връщане</th>
                            <th onclick="priceSort(3)">Цена (лв)</th>
                        </tr>
                        <xsl:for-each select="//ns:trip">
                            <tr>
                                <td>
                                    <xsl:value-of select="@destination"/>
                                </td>
                                <td>
                                    <xsl:value-of select="ns:startDate"/>
                                </td>
                                <td>
                                    <xsl:value-of select="ns:endDate"/>
                                </td>
                                <td>
                                    <xsl:value-of select="ns:price"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </div>
                <xsl:apply-templates select="//ns:trip" />
            </body>
        </html>
    </xsl:template>

    <xsl:template match="ns:trip">
        <div class="trip">
            <h2><xsl:value-of select="ns:title" /></h2>
            <p class="date">Дати: <xsl:value-of select="ns:startDate" /> до <xsl:value-of select="ns:endDate" /></p>
            <table>
                <td class="test">
                    <xsl:apply-templates select="ns:photo/ns:src" />
                </td>
                <td>
                    <p class="desc"><xsl:value-of select="ns:description" /></p>
                </td>
            </table>
            <h2>Маршрут</h2>
            <ul>
                <xsl:for-each select="ns:route/ns:stop">
                    <li class="decoration" onclick="displayText(this)">
                        <xsl:value-of select="ns:stopName"/>
                    </li>
                    <div class="textField" style="display: none;">
                        <p class="desc"><xsl:value-of select="ns:stopInfo"/></p>
                    </div>
                </xsl:for-each>
            </ul>
            <h3>Пътници:</h3>
            <ol class="desc">
                <xsl:for-each select="ns:listTourists/ns:touristName">
                    <li><xsl:value-of select="."/></li>
                </xsl:for-each>
            </ol>
            <h3>Цена: <xsl:value-of select="ns:price"/> лева</h3>
        </div>
        <br />
    </xsl:template>

    <xsl:template match="ns:photo/ns:src">  
        <img class="big_image" src="{unparsed-entity-uri(@url)}"/> 
    </xsl:template>

</xsl:stylesheet>