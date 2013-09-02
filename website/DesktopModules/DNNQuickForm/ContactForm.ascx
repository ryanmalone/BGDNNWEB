<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls"%>
<div class="dnnForm">
<div id="form_main">
<div class="dnnFormItem">
<dnn:label runat="server" Text="Name" HelpText="Please enter your name in the space provided" Suffix=":" CssClass="dnn_lable" />
<asp:textbox id="Name" runat="server" CssClass="dnnFormRequired" />
<asp:RequiredFieldValidator ID="reqName" ControlToValidate="Name" cssclass="dnnFormMessage dnnFormError" runat="server" Text="Name is required" />

</div>
<div class="dnnFormItem">
<dnn:label runat="server" Text="Email" HelpText="Please enter your email address in the space provided" Suffix=":" />
<asp:textbox id="Email" runat="server" CssClass="dnnFormRequired" />
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="Email" cssclass="dnnFormMessage dnnFormError" runat="server" Text="Email Address is required" />
</div>
<div class="dnnFormItem">
<dnn:label ID="lbl_sub" runat="server" Text="Subject" HelpText="Please enter your email subject" Suffix=":" />
<asp:textbox id="txt_sub" runat="server" CssClass="dnnFormRequired" />
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txt_sub" cssclass="dnnFormMessage dnnFormError" runat="server" Text="Subject is required" />
</div>
<div class="dnnFormItem">
<dnn:label runat="server" Text="Message" HelpText="Please send us your comments" Suffix=":" />

<textarea id="Message" rows="8" runat="server"></textarea>
</div>
<div class="dnnFormItem">
<dnn:label runat="server" Text="Captcha" HelpText="We want to make sure you aren't a robot." Suffix=":" />
<dnn:captchacontrol id="ctlCaptcha" captchawidth="130" captchaheight="40" runat="server" errorstyle-cssclass="NormalRed" />
</div>
<div class="dnnFormItem">
<div id="contact_submit"style="margin-left:9%;">
<asp:placeholder id="plhButton" runat="server" />
</div>
</div>
</div>
</div>
