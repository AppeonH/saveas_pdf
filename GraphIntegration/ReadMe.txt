PBLs required:	graphintegration.pbl
Resource File:   text_graph.txt, csv_graph.csv, xml_graph.xml
Database Connection: EAS Demo DB V110 Unicode

Description:The primary testing area of the case is for some properties and functions of graph datawindow.

Testing Point:
1. Change all graph properties, should show changes in the graph datawindow
   Because editchange event is partially supported in webform ,click button SetProperties to change editable properties.
2. Change Series property , effect seriescount
3. Change category property, effect categorycount
4. Change categorysort if category is dept_id or sex, effect findcategory
5. ImportFile, effect seriescount,categorycount and findcategory
6. Click SetRedraw_F and change graph properties, should not show changes until click SetRedraw_T(Not supported in Webform)



