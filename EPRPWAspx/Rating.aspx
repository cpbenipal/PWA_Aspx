<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="Rating.aspx.vb" Inherits="EPRPWAspx.Rating" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .outer-container {
            width: 100%;
            overflow: auto;
            display: inline-flex;
        }

        ._th {
            width: 200px;
            float: left;
            padding: 10px 0px;
            text-align: left;
            font-size: 110%;
            font-weight: bold;
        }

        ._td {
            width: 100px;
            float: left;
            padding: 10px 0px;
            text-align: center;
        }

        ._tbody {
            text-align: right;
            /* border: 1px solid #333; */
            float: left;
            padding: 15px;
            margin-top: 10px;
            border-radius: 10px;
            box-shadow: 0 0 5px #c5c5c5;
        }

        .submitReview {
            margin: 20px calc(50% - 100px) 50px;
            width: 200px;
            height: 30px;
        }

        .textarea {
            width: 500px;
            resize: none;
            height: 100px;
            margin: 10px;
            border-color: #c5c5c5;
            border-radius: 5px;
            padding: 10px;
        }
    </style>
    <div class="col-12">
        <div class="card">
            <div class="card-body">

                <div class="form-group">

                    <div class="row">
                        <div class="col-xs-12 col-sm-2">
                            <h4 class="card-title">Rating</h4>
                        </div>

                    </div>
                </div>
                <div>
                    <div style="width: 750px; margin: auto; padding: 10px;">
                        <div style="float: left; padding: 15px;">
                            <div class="_th" style="height: 20px;"></div>
                            <div class="_td"><b>1-Poor</b></div>
                            <div class="_td"><b>2-Fair</b></div>
                            <div class="_td"><b>3-Satisfactory</b></div>
                            <div class="_td"><b>4-Good</b></div>
                            <div class="_td"><b>5-Excellent</b></div>
                            <!---->
                        </div>
                        <div class="_tbody">
                            <div class="_th">Job Knowledge</div>
                             <div class="_td">
                                <asp:RadioButton ID="rd" GroupName="J" runat="server" />
                            </div>
                            <div class="_td">
                                <asp:RadioButton ID="RadioButton1" GroupName="J" runat="server" />
                            </div>
                        <div class="_td">
                            <asp:RadioButton ID="RadioButton2" GroupName="J" runat="server" />
                        </div>
                        <div class="_td">
                            <asp:RadioButton ID="RadioButton3" GroupName="J" runat="server" />
                        </div>
                        <div class="_td">
                            <asp:RadioButton ID="RadioButton4" GroupName="J" runat="server" />
                        </div>
                            <textarea placeholder="comment" class="textarea ng-untouched ng-pristine ng-valid"></textarea>
                        </div>
                        <div class="_tbody">
                            <div class="_th">Work Quality</div>
                                  <div class="_td">
                                <asp:RadioButton ID="RadioButton5" GroupName="J" runat="server" />
                            </div>
                            <div class="_td">
                                <asp:RadioButton ID="RadioButton6" GroupName="J" runat="server" />
                            </div>
                        <div class="_td">
                            <asp:RadioButton ID="RadioButton7" GroupName="J" runat="server" />
                        </div>
                        <div class="_td">
                            <asp:RadioButton ID="RadioButton8" GroupName="J" runat="server" />
                        </div>
                        <div class="_td">
                            <asp:RadioButton ID="RadioButton9" GroupName="J" runat="server" />
                        </div>
                            <textarea placeholder="comment" class="textarea ng-untouched ng-pristine ng-valid"></textarea>
                        </div>
                        <div class="_tbody">
                            <div class="_th">Attendane/Punctuality</div>
                                    <div class="_td">
                                <asp:RadioButton ID="RadioButton10" GroupName="J" runat="server" />
                            </div>
                            <div class="_td">
                                <asp:RadioButton ID="RadioButton11" GroupName="J" runat="server" />
                            </div>
                        <div class="_td">
                            <asp:RadioButton ID="RadioButton12" GroupName="J" runat="server" />
                        </div>
                        <div class="_td">
                            <asp:RadioButton ID="RadioButton13" GroupName="J" runat="server" />
                        </div>
                        <div class="_td">
                            <asp:RadioButton ID="RadioButton14" GroupName="J" runat="server" />
                        </div>
                            <textarea placeholder="comment" class="textarea ng-untouched ng-pristine ng-valid"></textarea>
                        </div>
                        <div class="_tbody">
                            <div class="_th">Productivity</div>
                                 <div class="_td">
                                <asp:RadioButton ID="RadioButton15" GroupName="J" runat="server" />
                            </div>
                            <div class="_td">
                                <asp:RadioButton ID="RadioButton16" GroupName="J" runat="server" />
                            </div>
                        <div class="_td">
                            <asp:RadioButton ID="RadioButton17" GroupName="J" runat="server" />
                        </div>
                        <div class="_td">
                            <asp:RadioButton ID="RadioButton18" GroupName="J" runat="server" />
                        </div>
                        <div class="_td">
                            <asp:RadioButton ID="RadioButton19" GroupName="J" runat="server" />
                        </div>
                            <textarea placeholder="comment" class="textarea ng-untouched ng-pristine ng-valid"></textarea>
                        </div>
                        <div class="_tbody">
                            <div class="_th">Communication/Listing</div>
                                   <div class="_td">
                                <asp:RadioButton ID="RadioButton20" GroupName="J" runat="server" />
                            </div>
                            <div class="_td">
                                <asp:RadioButton ID="RadioButton21" GroupName="J" runat="server" />
                            </div>
                        <div class="_td">
                            <asp:RadioButton ID="RadioButton22" GroupName="J" runat="server" />
                        </div>
                        <div class="_td">
                            <asp:RadioButton ID="RadioButton23" GroupName="J" runat="server" />
                        </div>
                        <div class="_td">
                            <asp:RadioButton ID="RadioButton24" GroupName="J" runat="server" />
                        </div>
                            <textarea placeholder="comment" class="textarea ng-untouched ng-pristine ng-valid"></textarea>
                        </div>
                        <div class="_tbody">
                            <div class="_th">Dependability</div>
                                  <div class="_td">
                                <asp:RadioButton ID="RadioButton25" GroupName="J" runat="server" />
                            </div>
                            <div class="_td">
                                <asp:RadioButton ID="RadioButton26" GroupName="J" runat="server" />
                            </div>
                        <div class="_td">
                            <asp:RadioButton ID="RadioButton27" GroupName="J" runat="server" />
                        </div>
                        <div class="_td">
                            <asp:RadioButton ID="RadioButton28" GroupName="J" runat="server" />
                        </div>
                        <div class="_td">
                            <asp:RadioButton ID="RadioButton29" GroupName="J" runat="server" />
                        </div>
                            <textarea placeholder="comment" class="textarea ng-untouched ng-pristine ng-valid"></textarea>
                        </div>
                        <!---->
                        <div class="_tbody">
                            <div class="_th">Average Rating</div>
                            <div class="_td">2.83 </div>
                        </div>
                    </div>
                    <button class="submitReview">Submit</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
