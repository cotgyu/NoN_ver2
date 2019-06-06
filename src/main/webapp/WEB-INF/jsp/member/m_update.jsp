<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<article>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h3>
					<span>Team Search 회원 정보 수정</span>
				</h3>
				<hr>
				<form class="form-horizontal" method="post" name="updateC" action="updateResult" >
					<!-- 이름 입력부분 -->
					<div class="form-group">
						<label class="control-label col-sm-3">Name <span
							class="text-danger">*</span></label>
						<div class="col-md-7 col-sm-9">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-id-card" ></i></span>
								<input type="text" class="form-control" name="u_name"
									id="u_name" placeholder="Please enter at least 2 characters" value="${sessionScope.member.name }">
							</div>
							<div class="input-group">	
								<p class="font-italic" id = "u_nameFlag" style=" color:red;">
								</p>
							</div>
						</div>
					</div>
				
					<!-- 닉네임 입력부분  -->
					<div class="form-group">
						<label class="control-label col-sm-3">Nick <span
							class="text-danger">*</span></label>
						<div class="col-md-7 col-sm-9">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-id-card" ></i></span>
								<input type="text" class="form-control" name="u_nick"
								id="u_nick" placeholder="Choose Nick (5-20 chars) using Hangul, English, and numbers" 
								value="${sessionScope.member.nick}">
							</div>
							<div>
								<p class="font-italic" id = "u_nickFlag" style=" color:red;">
								</p>	
							</div>
						</div>
					</div>
					
					<!-- 이메일 입력부분 -->
					<div class="form-group">
						<label class="control-label col-sm-3">Email<span
							class="text-danger">*</span></label>
						<div class="col-md-11 ">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-envelope-o"></i></span> 
								<input type="text" style="width:80px;"
									class="form-control" name="u_email1" id="u_email1" size="5"
									placeholder="Email ID" value="${sessionScope.member.email.split('@')[0]}"/>
									&nbsp; <b style="margin-top:5px;">@</b> &nbsp;
								<input type="text" style="width:80px;"
									class="form-control" name="u_email2" id="u_email2" size="5"
									placeholder="ABCDE.com etc.." value="${sessionScope.member.email.split('@')[1]}"/>
									&nbsp; &nbsp;	
									
								<select name="u_email3" id="u_email3" class="form-control" style="width:80px;">
									<option value="0" selected>Direct Input</option>
									<option value="naver.com">naver.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="nate.com">nate.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="hotmail.com">hotmail.com</option>
								</select>
								&nbsp;&nbsp;&nbsp;
								<input type="button" id="u_btnEmailCode" class="btn btn-outline-info" value="이메일 인증" />	
							</div>
							<div>	
								<p class="font-italic" id = "u_emailFlag" style="color:red;margin-top:10px;">
								</p>
							</div>
						</div>
					</div>
	
					<!-- 생년 월일 -->
					<div class="form-group">
						<label class="control-label col-sm-3">Birth <span
							class="text-danger">*</span></label>
						<div class="col-md-7 col-sm-8">
							<select name="u_birth1" id="u_birth1" class="form-control" style="width:150px;display:inline;">
										<option value="0">Year</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1955 ? 'selected' : '' }>1955</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1956 ? 'selected' : '' }>1956</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1957 ? 'selected' : '' }>1957</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1958 ? 'selected' : '' }>1958</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1959 ? 'selected' : '' }>1959</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1960 ? 'selected' : '' }>1960</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1961 ? 'selected' : '' }>1961</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1962 ? 'selected' : '' }>1962</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1963 ? 'selected' : '' }>1963</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1964 ? 'selected' : '' }>1964</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1965 ? 'selected' : '' }>1965</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1966 ? 'selected' : '' }>1966</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1967 ? 'selected' : '' }>1967</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1968 ? 'selected' : '' }>1968</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1969 ? 'selected' : '' }>1969</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1970 ? 'selected' : '' }>1970</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1971 ? 'selected' : '' }>1971</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1972 ? 'selected' : '' }>1972</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1973 ? 'selected' : '' }>1973</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1974 ? 'selected' : '' }>1974</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1975 ? 'selected' : '' }>1975</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1976 ? 'selected' : '' }>1976</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1977 ? 'selected' : '' }>1977</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1978 ? 'selected' : '' }>1978</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1979 ? 'selected' : '' }>1979</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1980 ? 'selected' : '' }>1980</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1981 ? 'selected' : '' }>1981</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1982 ? 'selected' : '' }>1982</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1983 ? 'selected' : '' }>1983</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1984 ? 'selected' : '' }>1984</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1985 ? 'selected' : '' }>1985</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1986 ? 'selected' : '' }>1986</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1987 ? 'selected' : '' }>1987</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1988 ? 'selected' : '' }>1988</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1989 ? 'selected' : '' }>1989</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1990 ? 'selected' : '' }>1990</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1991 ? 'selected' : '' }>1991</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1992 ? 'selected' : '' }>1992</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1993 ? 'selected' : '' }>1993</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1994 ? 'selected' : '' }>1994</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1995 ? 'selected' : '' }>1995</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1996 ? 'selected' : '' }>1996</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1997 ? 'selected' : '' }>1997</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1998 ? 'selected' : '' }>1998</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 1999 ? 'selected' : '' }>1999</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 2000 ? 'selected' : '' }>2000</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 2001 ? 'selected' : '' }>2001</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 2002 ? 'selected' : '' }>2002</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 2003 ? 'selected' : '' }>2003</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 2004 ? 'selected' : '' }>2004</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 2005 ? 'selected' : '' }>2005</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 2006 ? 'selected' : '' }>2006</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 2007 ? 'selected' : '' }>2007</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 2008 ? 'selected' : '' }>2008</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 2009 ? 'selected' : '' }>2009</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 2010 ? 'selected' : '' }>2010</option>
										<option ${ sessionScope.member.birth.split('/')[0] == 2011 ? 'selected' : '' }>2011</option>
									</select>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<select name="u_birth2" id="u_birth2" class="form-control" style=width:150px;display:inline;>
										<option value="0">Month</option>
										<option ${ sessionScope.member.birth.split('/')[1] == 01 ? 'selected' : '' }>01</option>
										<option ${ sessionScope.member.birth.split('/')[1] == 02 ? 'selected' : '' }>02</option>
										<option ${ sessionScope.member.birth.split('/')[1] == 03 ? 'selected' : '' }>03</option>
										<option ${ sessionScope.member.birth.split('/')[1] == 04 ? 'selected' : '' }>04</option>
										<option ${ sessionScope.member.birth.split('/')[1] == 05 ? 'selected' : '' }>05</option>
										<option ${ sessionScope.member.birth.split('/')[1] == 06 ? 'selected' : '' }>06</option>
										<option ${ sessionScope.member.birth.split('/')[1] == 07 ? 'selected' : '' }>07</option>
										<option ${ sessionScope.member.birth.split('/')[1] == 08 ? 'selected' : '' }>08</option>
										<option ${ sessionScope.member.birth.split('/')[1] == 09 ? 'selected' : '' }>09</option>
										<option ${ sessionScope.member.birth.split('/')[1] == 10 ? 'selected' : '' }>10</option>
										<option ${ sessionScope.member.birth.split('/')[1] == 11 ? 'selected' : '' }>11</option>
										<option ${ sessionScope.member.birth.split('/')[1] == 12 ? 'selected' : '' }>12</option>
									</select>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<select name="u_birth3" id="u_birth3" class="form-control" style="width:150px;display:inline;">
										<option value="0">Date</option>
										<option ${ member.birth.split('/')[2] == 1 ? 'selected' : '' }>1</option>
										<option ${ member.birth.split('/')[2] == 2 ? 'selected' : '' }>2</option>
										<option ${ member.birth.split('/')[2] == 3 ? 'selected' : '' }>3</option>
										<option ${ member.birth.split('/')[2] == 4 ? 'selected' : '' }>4</option>
										<option ${ member.birth.split('/')[2] == 5 ? 'selected' : '' }>5</option>
										<option ${ member.birth.split('/')[2] == 6 ? 'selected' : '' }>6</option>
										<option ${ member.birth.split('/')[2] == 7 ? 'selected' : '' }>7</option>
										<option ${ member.birth.split('/')[2] == 8 ? 'selected' : '' }>8</option>
										<option ${ member.birth.split('/')[2] == 9 ? 'selected' : '' }>9</option>
										<option ${ member.birth.split('/')[2] == 10 ? 'selected' : ''}>10</option>
										<option ${ member.birth.split('/')[2] == 11 ? 'selected' : '' }>11</option>
										<option ${ member.birth.split('/')[2] == 12 ? 'selected' : '' }>12</option>
										<option ${ member.birth.split('/')[2] == 13 ? 'selected' : '' }>13</option>
										<option ${ member.birth.split('/')[2] == 14 ? 'selected' : '' }>14</option>
										<option ${ member.birth.split('/')[2] == 15 ? 'selected' : '' }>15</option>
										<option ${ member.birth.split('/')[2] == 16 ? 'selected' : '' }>16</option>
										<option ${ member.birth.split('/')[2] == 17 ? 'selected' : '' }>17</option>
										<option ${ member.birth.split('/')[2] == 18 ? 'selected' : '' }>18</option>
										<option ${ member.birth.split('/')[2] == 19 ? 'selected' : '' }>19</option>
										<option ${ member.birth.split('/')[2] == 20 ? 'selected' : '' }>20</option>
										<option ${ member.birth.split('/')[2] == 21 ? 'selected' : '' }>21</option>
										<option ${ member.birth.split('/')[2] == 22 ? 'selected' : '' }>22</option>
										<option ${ member.birth.split('/')[2] == 23 ? 'selected' : '' }>23</option>
										<option ${ member.birth.split('/')[2] == 24 ? 'selected' : '' }>24</option>
										<option ${ member.birth.split('/')[2] == 25 ? 'selected' : '' }>25</option>
										<option ${ member.birth.split('/')[2] == 26 ? 'selected' : '' }>26</option>
										<option ${ member.birth.split('/')[2] == 27 ? 'selected' : '' }>27</option>
										<option ${ member.birth.split('/')[2] == 28 ? 'selected' : '' }>28</option>
										<option ${ member.birth.split('/')[2] == 29 ? 'selected' : '' }>29</option>
										<option ${ member.birth.split('/')[2] == 30 ? 'selected' : '' }>30</option>
										<option ${ member.birth.split('/')[2] == 31 ? 'selected' : '' }>31</option>
									</select>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</div>
					</div>
					
					<!-- 주소입력 부분 (우편번호) -->
					<div class="form-group">
						<label class="control-label col-sm-3">ZipCode <span
							class="text-danger">*</span></label>
						<div class="col-md-7 col-sm-8">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-address-card" ></i></span>
								<input type="text" class="form-control" readonly name="u_zipCode"
								id="u_zipCode" placeholder="Push Right Button" 
								 value="${sessionScope.member.zipCode }"/>
								&nbsp;&nbsp;
								<input type="button" id="u_btnZipcode" class="btn btn-outline-info" value="우편번호 찾기"/>
							</div>
						</div>
					</div>
					
					<!-- 주소입력 부분 (주소1) -->
					<div class="form-group">
						<label class="control-label col-sm-3">Address1 <span
							class="text-danger">*</span></label>
						<div class="col-md-7 col-sm-8">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-address-card" ></i></span>
								<input type="text" class="form-control" readonly name="u_address1"
								id="u_address1" placeholder="address" 
								 value="${sessionScope.member.address1 }"/>
							</div>
						</div>
					</div>
					
					<!-- 주소입력 부분(주소2) -->
					<div class="form-group">
						<label class="control-label col-sm-3">Address2 <span
							class="text-danger">*</span></label>
						<div class="col-md-7 col-sm-8">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-address-card" ></i></span>
								<input type="text" class="form-control" name="u_address2"
								id="u_address2" placeholder="Enter the rest of Address" 
								 value="${sessionScope.member.address2 }"/>
							</div>
							<div>	
								<p class="font-italic" id = "addressFlag" style=" color:red;margin-top:10px;">
								</p>
							</div>
						</div>
					</div>
				
				<!-- 성별 입력 부분 -->
					<div class="form-group">
						<label class="control-label col-sm-3">Gender <span
							class="text-danger">*</span></label>
						<div class="col-md-8 col-sm-9">
							<label> 
							<input name="u_gender" type="radio" value="Male" ${member.gender == "Male" ?"checked":"" }> Male
							</label>     
							<label> 
							<input name="u_gender" type="radio" value="Female" ${member.gender == "Female"?"checked":"" }> Female
							</label>
						</div>
					</div>
					
					<!-- 정보 이메일 수신여부 -->
					<div class="form-group">
						<label class="control-label col-sm-3">Info Email Get </label>
						<div class="col-md-8 col-sm-9">
							<label> <input name="u_emailGet" type="radio" value="true"
								${member.emailGet == "true"?"checked":"" }> Yes
							</label>     <label> <input name="u_emailGet" type="radio"
								value="false" ${member.emailGet == "false"?"checked":"" }> No
							</label>
						</div>
					</div>
					
					<!-- 폰번호 입력부분 -->
					<div class="form-group">
						<label class="control-label col-sm-3">Mobile <span
							class="text-danger">*</span></label>
						<div class="col-xs-10">
							<div class="form-inline" >
								<div class="form-group">
									<select name="u_mobile1" id="u_mobile1" class="form-control" style="width:80px;">
										<option value=""></option>
										<option ${member.mobile.split('-')[0] == 010 ? "selected" : "" }>010</option>
										<option ${member.mobile.split('-')[0] == 011 ? "selected" : "" }>011</option>
										<option ${member.mobile.split('-')[0] == 016 ? "selected" : "" }>016</option>
										<option ${member.mobile.split('-')[0] == 017 ? "selected" : "" }>017</option>
										<option ${member.mobile.split('-')[0] == 018 ? "selected" : "" }>018</option>
										<option ${member.mobile.split('-')[0] == 019 ? "selected" : "" }>019</option>
									</select>
								</div>
								<div class="form-group">
									<div class="input-group">
										&nbsp;-&nbsp;
										<input type="text" class="form-control" name="u_mobile2" id="u_mobile2" 
										value="${sessionScope.member.mobile.split('-')[1] }" size= "4" maxlength="4">
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">
										&nbsp;-&nbsp;
										<input type="text" class="form-control" name="u_mobile3" id="u_mobile3" 
										value="${sessionScope.member.mobile.split('-')[2] }" size= "4" maxlength="4">
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 집전화번호 입력부분  -->
					<div class="form-group">
						<label class="control-label col-sm-3">Tel Phone </label>
						<div class="col-xs-10">
							<div class="form-inline" >
								<div class="form-group">
									<select name="u_phone1" class="form-control" style="width:80px;">
										<option value=""></option>
										<option ${ member.phone.split('-')[0] == 02 ? "selected" : "" }>
											02</option>
										<option ${ member.phone.split('-')[0] == 031 ? "selected" : "" }>
											031</option>
										<option ${ member.phone.split('-')[0] == 032 ? "selected" : "" }>
											032</option>
										<option ${ member.phone.split('-')[0] == 033 ? "selected" : "" }>
											033</option>
										<option ${ member.phone.split('-')[0] == 041 ? "selected" : "" }>
											041</option>
										<option ${ member.phone.split('-')[0] == 042 ? "selected" : "" }>
											042</option>
										<option ${ member.phone.split('-')[0] == 043 ? "selected" : "" }>
											043</option>
										<option ${ member.phone.split('-')[0] == 044 ? "selected" : "" }>
											044</option>
										<option ${ member.phone.split('-')[0] == 051 ? "selected" : "" }>
											051</option>
										<option ${ member.phone.split('-')[0] == 052 ? "selected" : "" }>
											052</option>
										<option ${ member.phone.split('-')[0] == 053 ? "selected" : "" }>
											053</option>
										<option ${ member.phone.split('-')[0] == 054 ? "selected" : "" }>
											054</option>
										<option ${ member.phone.split('-')[0] == 055 ? "selected" : "" }>
											055</option>
										<option ${ member.phone.split('-')[0] == 061 ? "selected" : "" }>
											061</option>
										<option ${ member.phone.split('-')[0] == 062 ? "selected" : "" }>
											062</option>
										<option ${ member.phone.split('-')[0] == 063 ? "selected" : "" }>
											063</option>
										<option ${ member.phone.split('-')[0] == 064 ? "selected" : "" }>
											064</option>
									</select>
								</div>
								<div class="form-group">
									<div class="input-group">
										&nbsp;-&nbsp;
										<input type="text" class="form-control" name="u_phone2" id="u_phone2" 
										value="${sessionScope.member.phone.split('-')[1] }" size= "4" maxlength="4">
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">
										&nbsp;-&nbsp;
										<input type="text" class="form-control" name="u_phone3" id="u_phone3" 
										value="${sessionScope.member.phone.split('-')[2] }" size= "4" maxlength="4">
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="form-group">
						<div class="col-xs-offset-3 col-xs-10">
							<input type="submit" value="회원 정보 수정" id="u_btnUpdateSubmit" style="margin-top:10px;"
								class="btn btn-outline-primary btn-lg btn-block">
						</div>
					</div>
					
				</form>
			</div>
		</div>
	</div>

</article>