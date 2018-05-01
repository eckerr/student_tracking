var ratingdenominator=5
var onstarimage='http://www.dynamicdrive.com/ajaxrating/staryellow.gif'
var halfstarimage='http://www.dynamicdrive.com/ajaxrating/staryellowhalf.gif'
var offstarimage='http://www.dynamicdrive.com/ajaxrating/stargray.gif'
var ratingscripturl="http://"+window.location.hostname+"/ajaxrating/rateit.php"


function formatscore(num, d){ //remove any leading 0s and format number to be of specified denominator
var d=(typeof d=="undefined" || d<=0)? 100 : d
var formatted=parseInt(num.toString().replace(/^0+/, "")) //remove any leading 00s and trailing "%" signs
formatted=(formatted>0)? Math.round(formatted*d/100*10)/10 : 0 //round score/d to 1 decimal places
return formatted //return score
}

function rateit(id, votes, avgscore){
this.id=id
this.totalvotes=(votes=="")? 0 : votes
this.avgscore=avgscore
}

rateit.prototype.displaytext=function(tester){
var formatavgscore=formatscore(this.avgscore, ratingdenominator) //Format avgscore from percentage to designated unit
if (tester=="inclusion") //if function being invoked as part of displayrating() or votes>0
document.write('<br /><span class="scoreinfo"><b>'+formatavgscore+'/<sub>'+ratingdenominator+'</sub></b> from <b>'+this.totalvotes+'</b> votes</span><br /><div class="tipmessage"></div>')
else if (parseInt(tester)>0) //more than 1 vote
document.write('<span class="scoreinfoalt" title="out of 5. Total votes: '+this.totalvotes+'"><b>'+formatavgscore+'</b></span>')
}

rateit.prototype.displayrating=function(){
document.write('<div class="starcontainer" id="ratecontainer'+this.id+'" rel="'+this.totalvotes+'">') //store total votes in "rel" attr
var formatavgscore=formatscore(this.avgscore, ratingdenominator) //Format avgscore from percentage to designated unit
var halfstarcheck=(formatavgscore-Math.floor(formatavgscore))>=0.5? 1 : 0
for (var i=1; i<ratingdenominator+1; i++){
if (formatavgscore>=i) //display star?
document.write('<img id="'+i+'::on" src="../../root/testfiles/Indent_Menu_files/'+onstarimage+'" class="starclass" title="Rate this item '+i+' out of '+ratingdenominator+'" />')
else if (Math.floor(formatavgscore)+1==i && halfstarcheck)
document.write('<img id="'+i+'::half" src="../../root/testfiles/Indent_Menu_files/'+halfstarimage+'" class="starclass" title="Rate this item '+i+' out of '+ratingdenominator+'" />')
else
document.write('<img id="'+i+'::off" src="../../root/testfiles/Indent_Menu_files/'+offstarimage+'" class="starclass" title="Rate this item '+i+' out of '+ratingdenominator+'" />')
} //end loop

this.displaytext("inclusion")
document.write('</div>')

document.getElementById("ratecontainer"+this.id).onmouseover=rateit.selectrating
document.getElementById("ratecontainer"+this.id).onmouseout=rateit.selectrating
var instanceOfTicker=this
//new function(){instanceOfTicker.countrating()}
document.getElementById("ratecontainer"+this.id).onclick=rateit.countrating
}

rateit.selectrating=function(e){
var evtobj=window.event? window.event: e
var evttarget=window.event? window.event.srcElement : e.target
var ratingimages=this.getElementsByTagName("img")
if (evttarget.tagName=="IMG"){
this.getElementsByTagName("div")[0].style.visibility=(evtobj.type=="mouseover")? "visible" : "hidden"
this.getElementsByTagName("div")[0].innerHTML=(evtobj.type=="mouseover")? evttarget.getAttribute("title") : ""
for (var i=1; i<ratingdenominator+1; i++){
if (evtobj.type=="mouseover")
ratingimages[i-1].src=(parseInt(ratingimages[i-1].id)<=parseInt(evttarget.id))? onstarimage : offstarimage
else if (evtobj.type=="mouseout")
ratingimages[i-1].src=(ratingimages[i-1].id.indexOf("on")!=-1)? onstarimage : (ratingimages[i-1].id.indexOf("half")!=-1)? halfstarimage : offstarimage
}
}
}

rateit.confirmrating=function(e){
var evttarget=window.event? window.event.srcElement : e.target
}

rateit.countrating=function(e){ //function to count/update rating onClick
var evttarget=window.event? window.event.srcElement : e.target
if (evttarget.tagName.toUpperCase()=="IMG"){
var rateitemid=parseInt(this.id.replace("ratecontainer", "")) //actual ID of rated item
var score=parseInt(evttarget.getAttribute("id"))/ratingdenominator
score=Math.round(score*100) //Unit is percentage (ie: 60%)
var ajaxobj=createAjaxObj()
if (ajaxobj){
var parameters="id="+rateitemid+"&rating="+score+"&bustcache="+new Date().getTime()
ajaxobj.onreadystatechange=function(){rateit.updaterating(ajaxobj, rateitemid, score)}
ajaxobj.open('GET', ratingscripturl+"?"+parameters, true)
ajaxobj.send(null)
}
}
}

rateit.updaterating=function(ajaxinstance, itemid, score){ //function to count/update rating onClick
var ratecontainer=document.getElementById("ratecontainer"+itemid)
var ratingimages=ratecontainer.getElementsByTagName("img")
var fader=new faderoutine(itemid)
fader.fadeTo(0.2)
ratecontainer.onmouseover=null
ratecontainer.onmouseout=null
ratecontainer.onclick=null
if (ajaxinstance.readyState == 4){ //if request of file completed
if (ajaxinstance.status==200){
var xmldata=ajaxinstance.responseXML
if (xmldata.getElementsByTagName("latestscore").length==0){ //if error getting latest avgscore
fader.gradualFadeUp(0.2)
alert(ajaxinstance.responseText)
return
}
var totalvotes=xmldata.getElementsByTagName("totalvotes")[0].firstChild.nodeValue
var avgscore=xmldata.getElementsByTagName("avgscore")[0].firstChild.nodeValue
var votedcheck=xmldata.getElementsByTagName("voted")[0].firstChild.nodeValue
avgscore=formatscore(avgscore, ratingdenominator) //format score from "098%" to score/ratingdenominator
var halfstarcheck=(avgscore-Math.floor(avgscore))>=0.5? 1 : 0
for (var i=1; i<ratingdenominator+1; i++){
ratingimages[i-1].src=(avgscore>=i)? onstarimage : (Math.floor(avgscore)+1==i && halfstarcheck)? halfstarimage : offstarimage
ratingimages[i-1].className=""
}
ratecontainer.getElementsByTagName("span")[0].innerHTML="<b>"+avgscore+"<sub>/"+ratingdenominator+"</sub></b> from <b>"+totalvotes+"</b> votes"
if (votedcheck=="yes")
alert("Vote not recorded, as you have voted already!")
ratecontainer.removeChild(ratecontainer.getElementsByTagName("div")[0]) //remove tip message div
fader.gradualFadeUp(0.2)
}
}
}