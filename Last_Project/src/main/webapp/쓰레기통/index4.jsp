/**
 * @constructor
 * @description NAVER Login authorize API
 * @author nid.nullism@navercorp.com
 * @version 0.0.2
 * @date 15. 06. 25
 * @copyright 2015 Licensed under the MIT license.
 */
 
/**
 怨듯넻 �쁺�뿭
 */
//踰꾪듉 醫낅쪟�뿉 �?�븳 �젙�쓽
BUTTON_TYPE = 1;
BANNER_SMALL_TYPE = 2;
BANNER_BIG_TYPE = 3;
//踰꾪듉 �깋源붿뿉 �?�븳 �젙�쓽
BUTTON_COLOR_WHITE = "white";
BUTTON_COLOR_GREEN = "green";

var naver_id_login = function (client_id,redirect_uri)
{
	this.button_color = BUTTON_COLOR_GREEN;
	this.button_type = BUTTON_TYPE;
	this.button_height = 40;
	this.nil_domain = "";
	this.response_type="token";
	this.authorize_url="https://nid.naver.com/oauth2.0/authorize";
	this.state = "";
	this.scope="";
	this.client_id = client_id;
	this.redirect_uri = redirect_uri;
	this.cookie_name="nil_state";
	this.popup = false;
	this.oauthParams = {};
	this.profileParams = {};
	this.is_callback = false;
	this.callback_status="";
	this.callback_message="";

/**
 * 濡쒓렇�씤李� �뙘�뾽 �꽕�젙
 * @ignore
 * @return void
 * @private
 */
	this.setPopup = function() {
		this.popup = true;
	}
/**
 * �꽌鍮꾩뒪 �룄硫붿씤 �꽕�젙
 * @ignore
 * @return void
 * @private
 */
	this.setState = function(state_value) {
		this.state = ((typeof(state_value)!='undefined') && (state_value != "") ) ? state_value : "";
	}
/**
 * �꽌鍮꾩뒪 �룄硫붿씤 �꽕�젙
 * @ignore
 * @return void
 * @private
 */
	this.setDomain = function(domain_value) {
		this.nil_domain = ((typeof(domain_value)!='undefined') && (domain_value != "") ) ? domain_value : "";
	}
/**
 * �꽕�씠踰� �븘�씠�뵒濡� 濡쒓렇�씤 踰꾪듉 �뵒�옄�씤 �꽑�깮
 * @ignore
 * @return void
 * @private
 */
	this.setButton = function(button_color,button_type,button_height) {
		this.button_color = ((typeof(button_color)!='undefined') && (button_color != "") ) ? button_color : BUTTON_COLOR_GREEN;
		this.button_type = ((typeof(button_type)!='undefined') && (button_type != "") ) ? button_type : BUTTON_TYPE;
		this.button_height = ((typeof(button_height)!='undefined') && (button_height != "") ) ? button_height : 40;
	}
/**
 * oauth 2.0 spec �쓽 state 媛� �옄�룞 �깮�꽦
 * @ignore
 * @returns {*}
 * @private
 */
	this.getUniqState = function(){
		var stat_str = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) { var r = Math.random()*16|0, v = c === 'x' ? r : (r&0x3|0x8); return v.toString(16); });
		return stat_str;
	};
/**
 * local Storage�뿉 �빐�떦 name �쓣 key濡� 媛�吏��뒗 value 媛믪쓣 �븞�쟾�븯寃� 諛쏆븘�삩�떎.
 * @ignore
 * @param {string} local Storage �뿉 �?�옣�맂 �궎媛�
 * @private
 */
	this.getLocalStorageItemSafely = function () {
		try {
			var item = localStorage.getItem(this.cookie_name);
			if (item == null || item.length == 0) {
				return item;
			}
			return item.replace(/&/g, '&amp;')
				.replace(/"/g, '&quot;')
				.replace(/'/g, '&#x27;')
				.replace(/</g, '&lt;')
				.replace(/>/g, '&gt;');
		}	catch (e)
		{
			return null;
		}
	}

/**
 * local Storage �샊�? cookie storage �뿉 �썝�븯�뒗 key vlaue �뙇�쓣 �?�옣 �븳�떎.
 * @ignore
 * @param {string} local Storage �샊�? cookie storage �뿉 �?�옣�븷 value 媛�
 * @returns {*}
 * @private
 */
	this.setStateStore = function ()
	{
		try {
			if (this.nil_domain!="")
			{
				document.cookie = this.cookie_name+"=; path=/; domain="+this.nil_domain+"; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
			}
			else
			{
				document.cookie = this.cookie_name+"=; path=/; expires=Thu, 01 Jan 1970 00:00:00 UTC";
			}
			localStorage.setItem('nil_state', this.state);
			if (this.nil_domain!="")
			{
				var today = new Date();
				var expire = new Date(today.getTime() + 60 * 5 * 1000); //5遺꾧컙 �쑀�슚
				var curCookie = this.cookie_name+"=" + escape(this.state) + "; expires="
					+ expire.toGMTString() + "; domain=" + this.nil_domain+ ";path=/;";
				document.cookie = curCookie;	
			}
		}catch (e)
		{
			var today = new Date();
			var expire = new Date(today.getTime() + 60 * 5 * 1000); //5遺꾧컙 �쑀�슚
			var curCookie = this.cookie_name+"=" + escape(this.state) + "; expires="
				+ expire.toGMTString() + ";path=/;";
			document.cookie = curCookie;	
		}
	}

/**
 * �꽕�씠踰� �븘�씠�뵒濡� 濡쒓렇�씤�븣 �궗�슜�븷 留곹겕�쓽 二쇱냼瑜� �깮�꽦�븳�떎.
 * @ignore
 * @private
 */
	this.getNaverIdLoginLink = function ()
	{
		if (!this.is_callback)
		{
			this.setStateStore();
		}
		else
		{
			this.state = this.oauthParams.state;
		}
		if ( ( this.client_id == undefined ) || ( this.client_id == "�벑濡앺븳 ClientID 媛�" ) || ( this.client_id.length < 5 ) )
		{
			alert("�벑濡앺븳 ClientID 媛믪쓣 �엯�젰�빐 二쇱꽭�슂.");
			return false;
		}
		if ( ( this.redirect_uri == undefined ) || ( this.redirect_uri == "�벑濡앺븳 Callback URL 媛�" ) || ( this.redirect_uri.length < 5 ) )
		{
			alert("�벑濡앺븳 Callback URL 媛믪쓣 �엯�젰�빐 二쇱꽭�슂.");
			return false;
		}
		call_url = this.authorize_url+"?response_type="+this.response_type+"&client_id="+this.client_id+"&redirect_uri="+encodeURIComponent(this.redirect_uri)+"&state="+encodeURIComponent(this.state);
		if (this.scope!="")
		{
			call_url = call_url + "&scope="+encodeURIComponent(this.scope);
		}
		return call_url;
	}

/**
 * �꽕�씠踰� �븘�씠�뵒濡� 濡쒓렇�씤�븣 �궗�슜�븷 �씠誘몄? 諛� 留곹겕瑜� �깮�꽦�븳�떎.
 * @ignore
 * @param {int} �씠誘몄?�쓽 �넂�씠 媛� (px �떒�쐞)
 * @private
 */
	this.init_naver_id_login = function ()
	{
		var naver_id_login = document.getElementById('naver_id_login');
		if (naver_id_login==undefined)
		{
			alert("id 媛� naver_id_login �씤 div tag 媛� 議댁옱�빐�빞 �빀�땲�떎.");
			return false;
		}
		if (this.button_color=="green")
		{
			color="g";
		}
		else
		{
			color="w";
		}
		naver_id_login.innerHTML="";
		naver_id_login_contents="";
		naver_id_login_url = this.getNaverIdLoginLink();
		if (this.state==undefined || this.state=="")
		{
			this.state = this.getUniqState();
		}
		naver_id_popup_option = "";
		if (this.popup)
		{
			naver_id_popup_option = " onClick=\"window.open(this.href, 'naverloginpop', 'titlebar=1, resizable=1, scrollbars=yes, width=600, height=550'); return false\" ";
		}
		if (this.button_type == BUTTON_TYPE)
		{
			naver_id_login_contents="<a href='"+naver_id_login_url+"' "+naver_id_popup_option+" id='naver_id_login_anchor'><img src='http://static.nid.naver.com/oauth/button_"+color+".PNG' border='0' title='�꽕�씠踰� �븘�씠�뵒濡� 濡쒓렇�씤' width='"+this.button_height+"' height='"+this.button_height+"'></a> ";
		}
		else if (this.button_type == BANNER_SMALL_TYPE)
		{
			naver_id_login_contents="<a href='"+naver_id_login_url+"' "+naver_id_popup_option+" id='naver_id_login_anchor'><img src='http://static.nid.naver.com/oauth/small_"+color+"_in.PNG' border='0' title='�꽕�씠踰� �븘�씠�뵒濡� 濡쒓렇�씤' width='"+(this.button_height*656/250)+"px' height='"+this.button_height+"'></a> ";
		}
		else 
		{
			naver_id_login_contents="<a href='"+naver_id_login_url+"' "+naver_id_popup_option+" id='naver_id_login_anchor'><img src='http://static.nid.naver.com/oauth/big_"+color+".PNG' border='0' title='�꽕�씠踰� �븘�씠�뵒濡� 濡쒓렇�씤' width='"+(this.button_height*185/40)+"px' height='"+this.button_height+"px'></a> ";
		}
		naver_id_login.innerHTML=naver_id_login_contents;
		if (this.is_callback)
		{
			this.init_naver_id_login_callback();
		}
	}

/**
 * �궗�슜�옄媛� �뀑�똿�븳 state 媛믪쓽 �씪移� �뿬遺�瑜� �솗�씤
 * @ignore
 * @param {string} oauth callback url 濡� �쟾�떖�맂 state 媛�
 * @returns {boolean} �씪移� �뿬遺� true/false
 * @private
 */
	this.checkStateStore = function (receive_state)
	{
		//�궗�슜�옄媛� setting �븳 媛믪씠 �엳�쑝硫� �슦�꽑沅뚯쓣 媛�吏꾨떎.
		if (this.state!=undefined || this.state=="")
		{
			state = this.getLocalStorageItemSafely();
		}
		else
		{
			state = this.state;
		}
		if (state != null && state.length > 10 )
		{
			if (state==receive_state)
			{
				try {
					localStorage.removeItem(this.cookie_name)
				}catch (e) {}
				return true;
			}
			else
			{
				try {
					localStorage.removeItem(this.cookie_name)
				}catch (e) {}
				return false;
			}
		}
		else //check cookie
		{
		//�궗�슜�옄媛� setting �븳 媛믪씠 �엳�쑝硫� �슦�꽑沅뚯쓣 媛�吏꾨떎.
			if (this.state!=undefined || this.state=="")
			{
				state = this.getCookie();
			}
			else
			{
				state = this.state;
			}
			if (state != null && state.length > 10 )
			{
				if (state==receive_state)
				{
					if (this.nil_domain!="") {
						document.cookie = this.cookie_name+"=; path=/; domain="+this.nil_domain+"; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
					} else {
						document.cookie = this.cookie_name+"=; path=/; expires=Thu, 01 Jan 1970 00:00:00 UTC";
					}
					
					return true;
				}
				else
				{
					if (this.nil_domain!="") {
						document.cookie = this.cookie_name+"=; path=/; domain="+this.nil_domain+"; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
					} else {
						document.cookie = this.cookie_name+"=; path=/; expires=Thu, 01 Jan 1970 00:00:00 UTC";
					}
					return false;
				}
			}
			return false;
		}
	}

/**
 * cookie Storage�뿉 nil_state �쓣 key濡� 媛�吏��뒗 value 媛믪쓣 諛쏆븘�삩�떎.
 * @ignore
 * @return {string} cookie Storage �뿉 �?�옣�맂 value 媛�
 * @private
 */
	this.getCookie = function () {
		var b = "nil_state=";
		var c = b.length;
		var d = document.cookie.length;
		var e = 0;
		while (e < d) {
		    var f = e + c;
		    if (document.cookie.substring(e, f) == b) {
		        var g = document.cookie.indexOf(";", f);
		        if (g == -1) g = document.cookie.length;
		        return unescape(document.cookie.substring(f, g))
		    }
		    e = document.cookie.indexOf(" ", e) + 1;
		    if (e == 0) break
		}
		return null
	}
/**
 * callback �샇異� 二쇱냼瑜� parsing �빐�꽌 寃곌낵瑜� array 濡� �?�옣�븳�떎.
 * @ignore
 * @return {string} parameter 媛� �?�옣�맂 array
 * @private
 */
	this.parseCallBack = function (){
		var params = {};
		var queryString = (document.location+"").substring(1);
		var regex = /([^#?&=]+)=([^&]*)/g;
		var match;
		while ((match = regex.exec(queryString)) !== null) {
			params[decodeURIComponent(match[1])] = decodeURIComponent(match[2]);
		}
		this.oauthParams = params;
	}
/**
 * callback �샇異� 二쇱냼瑜� parsing �빐�꽌 寃곌낵瑜� array 濡� �?�옣�븳�떎.
 * @ignore
 * @return {string} parameter 媛� �?�옣�맂 array
 * @private
 */
	this.parseCallBack_check = function (){
		this.parseCallBack();
		if (this.oauthParams.access_token!=undefined)
		{
			this.is_callback = true;
		}
		else
		{
			this.is_callback = false;
		}
	}
/**
 * callback �럹�씠吏��뿉�꽌 �샇異� �릺硫� oauthParams �뿉 寃곌낵瑜� �?�옣�븯怨� 醫낅즺�븳�떎.
 * @ignore
 * @return void
 * @private
 */
	this.init_naver_id_login_callback = function (){
		this.parseCallBack_check();
		if (this.is_callback)
		{
			if (this.oauthParams.error==undefined)
			{
				if (this.oauthParams.access_token!=undefined)
				{
					if (this.checkStateStore(this.oauthParams.state))
					{
						this.callback_status="success";
						this.callback_message = "state check success";
					}
					else
					{
						/*
                         * state 媛� 留욎? �븡�쓬 cookie �궗�슜�씠 李⑤떒 �맂 寃쎌슦 
						 * �궗�슜�옄媛� 紐낆떆�쟻�쑝濡� state 媛믪쓣 �궗�슜�븳 寃쎌슦
						*/
						if (this.state == this.oauthParams.state)
						{
							this.callback_status="success";
							this.callback_message = "state check success";
						}
						else
						{
							/*
                        	 * state 媛� 留욎? �븡�쓬 localstorage 諛� cookie �궗�슜�씠 遺덇?�뒫�븳 寃쎌슦�뿏 nil_login.setState(....); 濡� 吏��젙 �빐�빞 �븿.
							*/
							alert("state 媛믪씠 留욎씠 �븡�뒿�땲�떎.");
							this.callback_status="warning";
							this.callback_message = "state miss match";
						}
					}
				}
			}
			else
			{
				/* �젙�긽�쟻�씤 �젒洹쇱씠 �븘�땶 寃쎌슦 */
				this.callback_status="fail";
				this.callback_message = "invalid access";
			}
		}
	}
	//�슦�꽑 callback �씤吏� �솗�씤
	this.parseCallBack_check();

	this.get_naver_userprofile = function(callback_func1) {
		$.ajax({
		url: "https://openapi.naver.com/v1/nid/getUserProfile.json?response_type=json",
		type: "GET",
		data: {"access_token":this.oauthParams.access_token},
		dataType: "jsonp",
		jsonp: "oauth_callback",
		success: function (result) {
			inner_profileParams.age           = result.response.age;
			inner_profileParams.birthday      = result.response.birthday;
			inner_profileParams.email         = result.response.email;
			inner_profileParams.enc_id        = result.response.enc_id;
			inner_profileParams.gender        = result.response.gender;
			inner_profileParams.id            = result.response.id;
			inner_profileParams.nickname      = result.response.nickname;
			inner_profileParams.profile_image = result.response.profile_image;
			inner_profileParams.name          = result.response.name;
			eval(callback_func1);
		},
		error: function (xhr, ajaxOptions, thrownError) {
			//�뿉�윭 泥섎━�뒗 �쟻�젅�엳
			alert(xhr.status);
			alert(thrownError);
		}
		});
	}
/*
 * �븘�옒 媛믪쓣 name �쑝濡� �궗�슜�븷 �닔 �엳�쓬.
 * age
 * birthday
 * email
 * enc_id
 * gender
 * id
 * nickname
 * profile_image
 * */
	this.getProfileData = function (name) {
		return inner_profileParams[name];
	}
	this.getOauthMessage = function ()
	{
		return this.callback_message;
	}
	this.getOauthStatus = function ()
	{
		return this.callback_status;
	}
	this.getAccessToken = function ()
	{
		return this.oauthParams.access_token;
	}
}
var inner_profileParams = {};