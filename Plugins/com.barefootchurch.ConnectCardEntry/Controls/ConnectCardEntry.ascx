﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ConnectCardEntry.ascx.cs" Inherits="RockWeb.Plugins.com_barefootchurch.ConnectCardEntry" %>

<script type="text/javascript">
    function pageLoad()
    {
        if ($('div.alert.alert-success').length > 0)
        {
            if (document.getElementById('<%= hfShowSuccess.ClientID%>').value == "true")
            {
                window.setTimeout("fadeAndClear()", 600000);
            }
            else
            {
                $('div.alert.alert-success').animate({ opacity: 0 }, 0);
            }
        }
    }

    function fadeAndClear()
    {
        $('div.alert.alert-success').animate({ opacity: 0 }, 15000000);
        document.getElementById('<%= hfShowSuccess.ClientID%>').value = "false";
    }
</script>

<asp:UpdatePanel ID="upnlContent" runat="server">
    <ContentTemplate>
        <asp:HiddenField ID="hfShowSuccess" runat="server" Value="false" />
        <Rock:NotificationBox ID="nbNotice" runat="server" Visible="false" NotificationBoxType="Danger" />
        <Rock:NotificationBox ID="nbWarning" runat="server" Visible="false" NotificationBoxType="Warning" />
        <asp:Panel ID="pnlView" runat="server" CssClass="panel panel-block">

            <div class="panel-heading">
                <h1 class="panel-title"><i class="fa fa-file-o"></i> Connect Card Entry</h1>
            </div>

            <div class="panel-body">
                <Rock:NotificationBox ID="nbMessage" runat="server" NotificationBoxType="Success" Title="Success" Visible="false" Text=""></Rock:NotificationBox>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Please correct the following" CssClass="alert alert-danger" />

                <div class="row">
                    <div class="col-md-12">
                        <div class="pull-left">
                            <Rock:PersonPicker ID="ppGuest" runat="server" Label="Choose an existing person" OnSelectPerson="ppGuest_SelectPerson" />
                            <asp:HyperLink ID="lbPersonProfile" runat="server" CssClass="btn btn-default" Visible="false" Target="_blank"><i class="fa fa-user"></i> View Profile</asp:HyperLink>
                        </div>
                        <div class="pull-right">
                                <Rock:CampusPicker ID="cpCampus" runat="server" CssClass="input-width-lg" Label="Campus" Required="true" AutoPostBack="true" OnSelectedIndexChanged="cpCampus_SelectedIndexChanged" />
                                <%-- Rock:RockRadioButtonList ID="rblSource" RequiredErrorMessage="An entry source is required." RepeatDirection="Vertical" runat="server" Required="true" AutoPostBack="true" OnSelectedIndexChanged="rblSource_SelectedIndexChanged"></Rock:RockRadioButtonList --%>
                        </div>
                    </div>
                </div>
                <asp:Panel ID="pnlNewPerson" runat="server">
                    <div class="well">
                        <p><i>Or if you can't find a person, add them as new:</i></p>
                        <div class="row">
                            <div class="col-md-6">
                                <h4>First Adult</h4>
                                <Rock:RockTextBox ID="tbFirstName" runat="server" Label="First Name" Required="true"></Rock:RockTextBox>
                                <Rock:RockTextBox ID="tbLastName" runat="server" Label="Last Name" Required="true"></Rock:RockTextBox>
                                <div class="row">
                                    <div class="col-sm-7">
                                        <Rock:RockRadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal" Label="Gender">
                                            <asp:ListItem Text="Male" Value="1" />
                                            <asp:ListItem Text="Female" Value="2" />
                                            <asp:ListItem Text="Unknown" Value="0" Selected="True" />
                                        </Rock:RockRadioButtonList>
                                    </div>
                                    <div class="col-sm-5">
                                        <Rock:DatePicker ID="dpBirthDate" runat="server" Label="Birth Date" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-7">
                                        <Rock:PhoneNumberBox ID="pnCell" runat="server" Label="Cell Phone" />
                                    </div>
                                    <div class="col-sm-5">
                                        <Rock:RockCheckBox ID="cbSms" runat="server" Label="&nbsp;" Text="Enable SMS" />
                                    </div>
                                </div>
                                <Rock:EmailBox ID="tbEmail" runat="server" Label="Email" Required="false"></Rock:EmailBox>
                            </div>
                            <div class="col-md-6">
                                <h4>Second Adult</h4>
                                <Rock:RockTextBox ID="tbSecondAdultFirstName" runat="server" Label="First Name"></Rock:RockTextBox>
                                <Rock:RockTextBox ID="tbSecondAdultLastName" runat="server" Label="Last Name"></Rock:RockTextBox>
                                <div class="row">
                                    <div class="col-sm-7">
                                        <Rock:RockRadioButtonList ID="rblSecondAdultGender" runat="server" RepeatDirection="Horizontal" Label="Gender">
                                            <asp:ListItem Text="Male" Value="1" />
                                            <asp:ListItem Text="Female" Value="2" />
                                            <asp:ListItem Text="Unknown" Value="0" Selected="True" />
                                        </Rock:RockRadioButtonList>
                                    </div>
                                    <div class="col-sm-5">
                                        <Rock:DatePicker ID="dpSecondAdultBirthDate" runat="server" Label="Birth Date" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-7">
                                        <Rock:PhoneNumberBox ID="pnSecondAdultCell" runat="server" Label="Cell Phone" />
                                    </div>
                                    <div class="col-sm-5">
                                        <Rock:RockCheckBox ID="cbSecondAdultSms" runat="server" Label="&nbsp;" Text="Enable SMS" />
                                    </div>
                                </div>
                                <Rock:EmailBox ID="tbSecondAdultEmail" runat="server" Label="Email" />
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-sm-7">
                                        <Rock:PhoneNumberBox ID="pnHome" runat="server" Label="Home Phone" />
                                    </div>
                                    <div class="col-sm-5">
                                    </div>
                                </div>
                                <Rock:DefinedValuePicker ID="dvpVisitSource" runat="server" Label="Source of Visit" DefinedTypeId="33" />
                                <Rock:AddressControl ID="acAddress" Label="Address" runat="server" />
                            </div>
                            <div class="col-md-6">
                                <Rock:RockRadioButtonList ID="rbMarried" runat="server" Label="Adults Married?" RepeatDirection="Horizontal">
                                    <asp:ListItem Text="Yes" Value="True" />
                                    <asp:ListItem Text="No" Value="False" Selected="True" />
                                </Rock:RockRadioButtonList>
                            </div>
                        </div>
                       <asp:Panel ID="pnlChildren" runat="server" CssClass="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Children</h3>
                            </div>
                            <div class="panel-body">
                                <Rock:PreRegistrationChildren ID="prChildren" runat="server" OnAddChildClick="prChildren_AddChildClick" />
                            </div>
                        </asp:Panel>
                    </div>
                </asp:Panel>

                <div class="col-sm-6">
                    <Rock:RockRadioButtonList ID="rblGuestType" runat="server" Label="Guest Type" />
                    <Rock:RockCheckBoxList ID="cblDecisions" runat="server" Label="Decision Made" />
                </div>
                <div class="col-sm-6">
                    <Rock:RockCheckBoxList ID="cblInterests" runat="server" Label="Interested in" />
                    <Rock:RockCheckBoxList ID="cblOthers" runat="server" Label="Other Items" />
                </div>

                <div class="col-sm-12">
                    <Rock:RockTextBox ID="tbComments" Label="Comments" runat="server" TextMode="MultiLine" Rows="3" />
                    <Rock:RockTextBox ID="tbPrayerRequests" Label="Prayer Requests" runat="server" TextMode="MultiLine" Rows="2" />
                </div>

                <div class="actions col-sm-12">
                    <asp:LinkButton ID="btnSave" runat="server" CssClass="btn btn-primary margin-r-lg" Text="Save" OnClick="btnSave_Click" OnClientClick="javascript:window.scrollTo(0,0);" />
                    <asp:LinkButton ID="btnCancel" runat="server" Text="Done" CausesValidation="false" OnClick="btnCancel_Click" />
                </div>
            </div>

        </asp:Panel>

    </ContentTemplate>
</asp:UpdatePanel>
