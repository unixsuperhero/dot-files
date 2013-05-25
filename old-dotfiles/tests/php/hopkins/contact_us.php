<?php
include("top.html");
echo 'Contact Us';
include("middle0.html");
include('middle1.html');
include('middle2.html');
?>
<center><table>

		<tr>
			<td colspan=2 width="100" valign=top>
				<form action="contact.php" method="post">
					<table>
						<tr>
							<td style="border:0px;">Name:</td>
							<td style="border:0px;"><input type="text" size="22" maxlength="40" name="name"></td>
						</tr>

						<tr>
							<td style="border:0px;">Email:</td>
							<td style="border:0px;"><input type="text" size="22" maxlength="40" name="email"></td>
						</tr>
						<tr>
							<td style="border:0px;">Phone:</td>
							<td style="border:0px;"><input type="text" size="22" maxlength="40" name="phone"></td>
						</tr>

						<tr>
							<td style="border:0px;" align=left colspan=2>
								Message:<br>
								<textarea name="message" cols="22" rows="8"></textarea>
							</td>
						</tr>
						<tr>
							<td style="border:0px;" colspan=2 align=right><input type="submit" value="Send"></td>

						</tr>
					</table>
				</form>
			</td>
			<td colspan=2 width="280"> <img src="../images/Images/contact.jpg"> </td>
		</tr>

		<tr>

			<td align=center width="25%" bgcolor="8BA0AA" style="color:white; padding-top:3px; padding-bottom:3px;">MIAMI AIRPORT</td>
			<td align=center width="25%" bgcolor="8BA0AA" style="color:white; padding-top:3px; padding-bottom:3px;">MIAMI BEACH</td>
			<td align=center width="25%" bgcolor="8BA0AA" style="color:white; padding-top:3px; padding-bottom:3px;">WEST PALM BEACH</td>
			<td align=center width="25%" bgcolor="8BA0AA" style="color:white; padding-top:3px; padding-bottom:3px;">COCONUT GROVE</td>
		</tr>

		<tr>

			<td valign=top>
				3300 NW 21st Street<br>
				Miami, FL 33142
			</td>
			<td valign=top>
				300 Alton Road<br>
				Miami Beach, FL 33139
			</td>
			<td valign=top>

				207 6th Street<br>
				W. Palm Beach, FL 33401
			</td>
			<td valign=top>
				At Monty's Marina<br>
				2550 South Bayshore Dr.<br>
				Coconut Grove, FL 33133
			</td>

		</tr>

		<tr>
			<td>P:305.635.7377</td>
			<td>P:305.534.0300</td>
			<td>P:561.832.4206</td>
			<td>P:305.854.4042</td>

		</tr>
	</table></center>
<?php
include("bottom.html");
?>