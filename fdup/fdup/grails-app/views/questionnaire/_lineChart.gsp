<gvisualization:apiImport/>
<%
	def title = 'Auswertung'
	def colums = [['string','Bereiche'],['number','untere Quartilgrenze'],['number',questionnaireInstance.examinee],['number','obere Quartilgrenze']]
   
%>
<gvisualization:imageLineChart  elementId="lineChart_div" columns="${colums}" title="${title }" data="${chartData }" width="${800}" height="${600}"/>
<div id="lineChart_div"></div>


<r:img uri="/images/ospulogo_transparent.png"/>