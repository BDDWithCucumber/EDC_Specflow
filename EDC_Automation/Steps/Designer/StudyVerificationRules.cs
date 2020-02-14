using BusinessProcesses.Designer;
using BusinessProcesses.Designer.CodeLists;
using BusinessProcesses.Designer.Common;
using BusinessProcesses.Designer.Domains;
using BusinessProcesses.Designer.LabMapping;
using BusinessProcesses.Designer.ManageLabs;
using BusinessProcesses.Designer.MapLabDict;
using BusinessProcesses.Designer.ModalDialogs;
using BusinessProcesses.Designer.StudyManagementJobs;
using BusinessProcesses.Designer.Warningpopup;
using BusinessProcesses.Forms;
using EDC_Automation.Helpers;
using Framework.Actions;
using Pages.Designer;
using Pages.Designer.Data;
using Pages.Designer.LabMapping;
using Pages.Designer.ManageLabs;
using Pages.Designer.MapLabDictionary;
using Pages.Designer.ModelDialog;
using System;
using System.Collections.Generic;
using System.IO;
using System.Threading;
using TechTalk.SpecFlow;
using TechTalk.SpecFlow.Assist;

namespace EDC_Automation.Steps.Designer
{
    [Binding]
    public sealed class StudyVerificationRules : TechTalk.SpecFlow.Steps
    {
        [Given(@"I logged in to Designer")]
        public void GivenILoggedInToDesigner()
        {
            if (!BP_DS_LoginUtilities.Login(ConfigurationHelper.BrowserType, ConfigurationHelper.DesignerUrl, ConfigurationHelper.UserName, ConfigurationHelper.Password))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Given(@"I logged in to Designer with download prompt false")]
        public void GivenILoggedInToDesignerWithDownloadPromptFalse()
        {
            if (!BP_DS_LoginUtilities.Login_prompt_download_false(ConfigurationHelper.BrowserType, ConfigurationHelper.DesignerUrl, ConfigurationHelper.UserName, ConfigurationHelper.Password))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see Designer Home Page")]
        [When(@"I see Designer Home Page")]
        public void ThenISeeDesignerHomePage()
        {
            if (!BP_DS_HomePageUtilities.DesignerHomePage())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"verify the display of ""(.*)""")]
        public void ThenVerifyTheDisplayOf(string p0)
        {
            ////*[@id="ctl00_ctl00_ContentBody_ContentBody_btnViewLabDict"]
            if (!BP_DS_ImportStudyUtilities.IsDictionaryNotificationTextExist())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"verify the display of message with Hyperlink")]
        public void ThenVerifyTheDisplayOfMessageWithHyperlink()
        {
            if (!BP_DS_ImportStudyUtilities.IsDictionaryNotificationLinkExist())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I should navigate to ""(.*)"" page\.")]
        public void ThenIShouldNavigateToPage_(string MapLabs)
        {
            if (!BP_DS_HomePageUtilities.IsMapLabDictionaryDisplayed(MapLabs))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I switch to the frame of ""(.*)""")]
        public void WhenISwitchToTheFrameOf(string FrameName)
        {
            FormUtilities.SwitchTOCreateFormFrame(FrameName);

        }

        [When(@"I switch out of frame")]
        [Then(@"I switch out of frame")]
        public void ThenISwitchOutOfFrame()
        {
            
            FormUtilities.SwitchToDefaultContent();
            Thread.Sleep(2000);
        }
        
        



        [When(@"I click on the study link ""(.*)"" of target app latest version and Local Labs option as Enabed")]
        [When(@"click on the study link ""(.*)"" of target app latest version")]
        [Then(@"I click on the Link ""(.*)""")]
        [When(@"I click on the Link ""(.*)""")]
        public void WhenIClickOnTheLink(string linkName)
        {
            if (!BP_DS_HomePageUtilities.ClickLinkInDesignerHomePage(linkName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I should see the error messages ""(.*)"",""(.*)""")]
        public void ThenIShouldSeeTheErrorMessages(string ErrorMessage1, string ErrorMessage2)
        {
            if (BP_DS_HomePageUtilities.GetErrorMessage1inManageLabs()!= ErrorMessage1)
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
           
            if (!(BP_DS_HomePageUtilities.GetErrorMessage2ManageLabs()).Equals(ErrorMessage2))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I See the Link ""(.*)"" in Forms page")]
        [Then(@"I See the Link ""(.*)"" in Domains page")]
        public void ThenISeeTheLinkInFormsPaage(string LinkName)
        {
            if (!BP_DS_HomePageUtilities.ControlIsVisible(LinkName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"I enter the unique Sponser name ""(.*)"" and Sponsor Label ""(.*)""")]
        public void WhenIEnterTheUniqueSponserNameAndSponsorLabel(string SponsorName, string SponsorLabel)
        {
            if (!BP_DS_StudyCreationUtilities.SetSponsorName(SponsorName) || !BP_DS_StudyCreationUtilities.SetSponsorLabel(SponsorLabel))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

       
        [Then(@"I click on the Save button to Save the Sponsor")]
        public void ThenIClickOnTheSaveButtonToSaveTheSponsor()
        {
            if (!BP_DS_StudyCreationUtilities.ClickOnSaveSponsor())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }



        [When(@"I click on  User sees the ""(.*)"" page")]
        public void WhenIClickOnUserSeesThePage(string QueryPage)
        {
            if (!BP_DS_ScriptingUtilities.VerifyThePageLoaded(QueryPage))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"I enter ""(.*)"" for the field Query")]
        public void WhenIEnterForTheFieldQuery(string QueryField)
        {
            if (!BP_DS_ScriptingUtilities.EnterTheVariableNameInQueryField(QueryField))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }          
            
        }

        [When(@"I click on Save button in Query page")]
        public void WhenIClickOnSaveButtonInQueryPage()
        {
            if (!BP_DS_ScriptingUtilities.ClickOnSave())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enter ""(.*)"" in the filter option")]
        public void WhenIEnterInTheFilterOption(string QueryName)
        {
            if (!BP_DS_ScriptingUtilities.EnterTheVariableNameInQueryField(QueryName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on Filter ICon")]
        public void WhenIClickOnFilterICon()
        {
            if (!BP_DS_ScriptingUtilities.ClickOnFilterIcon())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }



        [When(@"I select the Check box")]
        public void WhenISelectTheCheckbox()
        {
            if (!BP_DS_HomePageUtilities.SelectTheCheckBox())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see the message ""(.*)""")]
        public void ThenISeeTheMessage(string Message)
        {
            if (!BP_DS_HomePageUtilities.SeeTheMessage(Message))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"select the Document Name")]
        public void WhenSelectTheDocumentName()
        {
            Control_ActionUtilities.Dropdown_SelectItem(DS_Labs.LabMappingConfigureFileNameListbox1, "Study Name","not available");
        }
        [Then(@"saving  should see notification""(.*)""")]
        public void ThenSavingShouldSeeNotification(string notificationMessages)
        {
            if (!BP_DS_ImportStudyUtilities.ClickSaveButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
            String notificationMessage = "Configure file name has been successfully updated";
            if (!DS_BP_NotificationUtilities.VerifyNotification(notificationMessage))
            {
                Console.Write("not");
            }
        }

        [When(@"I enter study data details")]
        public void WhenIEnterSitesDetailsAndSave(Table studyList)
        {
            List<String> failSiteList = new List<String>();
            if (!BP_DS_StudyCreationUtilities.AddStudyData(studyList.CreateSet<StudyData>(), out failSiteList))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"Study file should be downloaded")]
        public void ThenStudyFileShouldBeDownloaded()
        {
            ScenarioContext.Current.Pending();
        }

        [When(@"I click on the Labs Button")]
        public void WhenIClickOnTheLabsButton()
        {
            if (!MapLabDictUtilities.ClickLabsButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on the Lab Mapping tab")]
        public void WhenIClickOnTheLabMappingTab(string linkName)
        {
            if (!BP_DS_HomePageUtilities.ClickLinkInDesignerHomePage(linkName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on the Codelists Button")]
        public void WhenIClickOnTheCodelistsButton()
        {
            if (!CodeListsUtilities.CodelistPage())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

               [Then(@"User sees the ""(.*)"" page")]
        public void ThenUserSeesTheCodelistsPage(String var)
        {
            if(BP_DS_ScriptingUtilities.VerifyThePageLoaded(var))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enter the Parameter Name ""(.*)""")]
        public void WhenIEnterTheParameterName(string ParameterName)
        {
            if (!BP_DS_ScriptingUtilities.EnterTheParameterName(ParameterName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select the Reference")]
        public void WhenISelectTheReference()
        {
            if (!BP_DS_ScriptingUtilities.SelectPar())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
       
        [When(@"I enter the Reference value ""(.*)""")]
        public void WhenIEnterTheReferenceValue(string ReferenceValue)
        {
            if (!BP_DS_ScriptingUtilities.EnterTheDataInParReference(ReferenceValue))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on the Parameter Save button")]
        public void WhenIClickOnTheParameterSaveButton()
        {
            if (!BP_DS_ScriptingUtilities.ClickonparSave())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on the Test case Sub tab")]
        public void WhenIClickOnTheTestCaseSubTab()
        {
            if (!BP_DS_ScriptingUtilities.ClickonTestcaseTab())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click  on the dropdown Testvalue")]
        public void WhenIClickOnTheDropdownTestvalue()
        {
            if (BP_DS_ScriptingUtilities.ClickOnDropDownOption())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
      



        [When(@"I click on the Domains Button")]
        public void WhenIClickOnTheDomainsButton()
        {
            if (!DomainsUtilities.ClickDoaminsButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I click on the Home Button")]
        [When(@"I click on the Home Button")]
        public void WhenIClickOnTheHomeButton()
        {
            if (!DS_BP_BreadCrumbUtilities.ClickHomeButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I click on the ""(.*)""")]
        public void WhenIClickOnThe(string p0)
        {
            if (!DS_BP_BreadCrumbUtilities.ClickLocalLabs())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [Then(@"I click on the error Link ""(.*)""")]
        [When(@"I click on the error Link ""(.*)""")]
        public void WhenIClickOnTheErrorLink(string errorLink)
        {
            if (!BP_DS_StudyVerificationMessagesUtilities.ClickError(errorLink))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on the study Link ""(.*)""")]
        public void WhenIClickOnTheStudyLink(string studyName)
        {
            if (!BP_DS_CreateStudyFromExistingUtilities.ClickStudyLink(studyName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }        
       
        [When(@"I click on the study Link ""(.*)"" and download it")]
        public void WhenIClickOnTheStudyLinkAndDowloadIt(string studyName)
        {
            if (!BP_DS_CreateStudyFromExistingUtilities.DownloadTheStudy(studyName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"Click on edit icon for ""(.*)""")]
        public void WhenClickOnEditIconFor(string domainItem)
        {
            if (!FormQuestionsUtilities.ClickDomainsItemsEditLink(domainItem))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I should see the notification ""(.*)""")]
        [Then(@"I should see the notification ""(.*)""")]
        public void ThenIShouldSeeTheNotification(string notificationMesage)
        {
            if (!DS_BP_NotificationUtilities.VerifyNotification(notificationMesage))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on link Add Question in the ""(.*)""")]
        public void ThenIClickOnLinkAddQuestionInThe(string TableName)
        {
            if (!(FormUtilities.AddQuestionButtonInTableQuestion(TableName)))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enter ""(.*)"" as table question")]
        public void ThenIEnter(string TableQuestion)
        {
            if (!(FormUtilities.SetQuestionDataInTableQuestion(TableQuestion)))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"I click on the link to add/edit secondary Codelist item to the primary Codelist item ""(.*)""")]
        public void WhenIClickOnTheLinkToAddEditSecondaryCodelistItemToThePrimaryCodelistItem(string primaryCodelist)
        {
            if (!CodelistsGroupUtilities.AddEditSecondaryCodelistItems(primaryCodelist))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I add country name ""(.*)"" and country description ""(.*)"" to group clodelist items")]
        [When(@"I add country name ""(.*)"" and country description ""(.*)"" to group clodelist items")]
        public void ThenIAddCountryNameAndCountryDescriptionToGroupClodelistItems(String countryName, String countryDesc)
        {
            if (!CodelistsGroupUtilities.AddGroupCodelistItems(countryName, countryDesc))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see the link ""(.*)""")]
        public void ThenISeeTheLink(string CodelistGroup)
        {
            if (!CodelistsGroupUtilities.VerifyTheGroupLink(CodelistGroup))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [Then(@"I remove country name ""(.*)"" and country description ""(.*)"" to group clodelist items")]
        [When(@"I remove country name ""(.*)"" and country description ""(.*)"" to group clodelist items")]
        public void ThenIRemoveCountryNameAndCountryDescriptionToGroupClodelistItems(String countryName, String countryDesc)
        {
            if (!CodelistsGroupUtilities.RemoveGroupCodelistItems(countryName, countryDesc))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"click on link ""(.*)"" tab")]
        public void WhenClickOnLinkTab(string linkname)
        {
            if (!CodelistsGroupUtilities.GroupsTab(linkname))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I Check on the CodelistGroup ""(.*)""")]
        public void WhenICheckOnTheCodelistGroup(string GroupName)
        {
            if (!CodelistsGroupUtilities.VerifyTheGroupLink(GroupName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }      


        [When(@"select the below items and delete")]
        [Then(@"select the below items and delete")]
        public void WhenSelectTheBelowItemsAndDelete(Table codelistdata)
        {
            List<String> codelistsItemDetailsList = new List<String>();
            List<CodelistItemsData> codeLists = (List<CodelistItemsData>)codelistdata.CreateSet<CodelistItemsData>();
            if (!DomainsUtilities.SelectCodeListsItemsToDelete(codeLists, out codelistsItemDetailsList))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"click on the tab Lab Test and select the below lab tests")]
        public void WhenClickOnTheTabLabTestAndSelectTheBelowLabTests(Table labtests)
        {
            List<String> codelistsItemDetailsList = new List<String>();
            List<MapLabDictionaryData> labDataList = (List<MapLabDictionaryData>)labtests.CreateSet<MapLabDictionaryData>();
            if (!DomainsUtilities.SetupLabTests(labDataList, out codelistsItemDetailsList))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"click on the tab Lab Unit and select the below lab units")]
        public void WhenClickOnTheTabLabUnitAndSelectTheBelowLabTests(Table labtests)
        {
            List<String> codelistsItemDetailsList = new List<String>();
            List<MapLabDictionaryData> labDataList = (List<MapLabDictionaryData>)labtests.CreateSet<MapLabDictionaryData>();
            if (!DomainsUtilities.SetupLabUnits(labDataList, out codelistsItemDetailsList))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I add the below labtest and labunit items and I should see the successful message")]
        [Then(@"I add the below labtest and labunit items and I should see the successful message")]
        public void ThenIAddTheBelowLabtestAndLabunitItemsAndIShouldSeeTheSuccessfulMessage(Table maplabdictionary)
        {
            List<String> codelistsItemDetailsList = new List<String>();
            List<MapLabDictionaryData> labDataList = (List<MapLabDictionaryData>)maplabdictionary.CreateSet<MapLabDictionaryData>();
            if (!DomainsUtilities.LabTestsUnitsDetails(labDataList, out codelistsItemDetailsList))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I add the below codelist items and I should see the successful notification message")]
        [Then(@"I add the below codelist items and I should see the successful notification message")]
        public void ThenIAddTheBelowCodelistItemsAndIShouldSeeTheSuccessfulNotificationMessage(Table codelistitemsdata)
        {
            List<String> maplabdictionaryData = new List<String>();
            List<CodelistItemsData> labDataList = (List<CodelistItemsData>)codelistitemsdata.CreateSet<CodelistItemsData>();
            if (!DomainsUtilities.CodeListsItemDetails(labDataList, out maplabdictionaryData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I add the below labs items for domain ""(.*)"" and I should see the successful notification message")]
        public void ThenIAddTheBelowLabsItemsForDomainAndIShouldSeeTheSuccessfulNotificationMessage(string domainName, Table codelistitemsdata)
        {
            List<String> maplabdictionaryData = new List<String>();
            List<Lab_DomainItemMappingData> labDataList = (List<Lab_DomainItemMappingData>)codelistitemsdata.CreateSet<Lab_DomainItemMappingData>();
            if (!DomainsUtilities.LabMappingItemDetails(domainName, labDataList, out maplabdictionaryData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I add the below labs items and I should see the successful notification message")]
        public void ThenIAddTheBelowLabsItemsAndIShouldSeeTheSuccessfulNotificationMessage(Table attributeitemsdata)
        {
            List<String> attributemappingData = new List<String>();
            List<AttributeMappingData> attributeDataList = (List<AttributeMappingData>)attributeitemsdata.CreateSet<AttributeMappingData>();
            if (!DomainsUtilities.AttributeMappingItemDetails(attributeDataList, out attributemappingData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
       
        [Then(@"I select ""(.*)"" for ""(.*)""")]
        public void ThenISelectFor(string valuetobeset, string attribute)
        {
            if (!DomainsUtilities.SetAttributeMappingData(valuetobeset, attribute))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I click on the Save button in Lab mappings page")]
        public void ThenIClickOnTheSaveButtonInLabMappingsPage()
        {
            if (!DomainsUtilities.SaveButtonInLabMapiings())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select the Domain Name ""(.*)""")]
        public void WhenISelectTheDomainName(string domainName)
        {
            if (!DomainsUtilities.SetDomainNameInLabMap(domainName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I click on the save button in Attribute mapping page")]
        public void ThenIClickOnTheSaveButtonInAttributeMappingPage()
        {
            if (!DomainsUtilities.SaveButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [Then(@"I update the below codelist items in the attribute mappings")]
        public void ThenIUpdateTheBelowCodelistItemsInTheAttributeMappings(Table attributeitemsdata)
        {
            List<String> attributemappingData = new List<String>();
            List<AttributeMappingData> attributeDataList = (List<AttributeMappingData>)attributeitemsdata.CreateSet<AttributeMappingData>();
            if (!DomainsUtilities.UpdateAttributeMapping(attributeDataList, out attributemappingData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"I map the below form question items")]
        [Then(@"I map the below form question items")]
        public void ThenIMapTheBelowFormQuestionItems(Table formquestionlabmappingdata)
        {
            List<String> formquestiondataList = new List<String>();
            List<FormQuestionsData> questionDataList = (List<FormQuestionsData>)formquestionlabmappingdata.CreateSet<FormQuestionsData>();
            if (!DomainsUtilities.SetFormQuestionLabMappingData(questionDataList, out formquestiondataList))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I add the below form question items and I should see the successful notification message")]
        [Then(@"I add the below form question items and I should see the successful notification message")]
        public void ThenIAddTheBelowFormQuestionItemsAndIShouldSeeTheSuccessfulNotificationMessage(Table formquestionsdata)
        {
            List<String> formquestiondataList = new List<String>();
            List<FormQuestionsData> questionDataList = (List<FormQuestionsData>)formquestionsdata.CreateSet<FormQuestionsData>();
            if (!DomainsUtilities.SetFormQuestionData(questionDataList, out formquestiondataList))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"select the Codelist as ""(.*)""")]
        public void WhenSelectTheCodelistAs(string codeListItem)
        {
            if (!FormQuestionsUtilities.SelectCodelistItem(codeListItem))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"click on domain item LabID edit save button")]
        public void WhenClickOnDomainItemEditLabIDSaveButton()
        {
            if (!DomainsUtilities.DomainItemSourceEditSaveButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"click on domain item domaincollDate edit save button")]
        public void WhenClickOnDomainItemDomainCollDateEditSaveButton()
        {
            if (!DomainsUtilities.DomainItemCollDateEditSaveButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"click on domain item CRFLTN edit save button")]
        public void WhenClickOnDomainItemCRFLTNEditSaveButton()
        {
            if (!DomainsUtilities.DomainItemCRFLTNEditSaveButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"click on domain item CRFOU edit save button")]
        public void WhenClickOnDomainItemCRFOUEditSaveButton()
        {
            if (!DomainsUtilities.DomainItemCRFOUEditSaveButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"click on domain item Lab Test Desc edit save button")]
        public void WhenClickOnDomainItemLabTestDescEditSaveButton()
        {
            if (!DomainsUtilities.DomainItemCRFLTDditSaveButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I click on the warning Link ""(.*)""")]
        [When(@"I click on the warning Link ""(.*)""")]
        public void WhenIClickOnTheWarningLink(string warningLink)
        {
            if (!BP_DS_StudyVerificationMessagesUtilities.ClickWarning(warningLink))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"I click on the Forms button")]
        public void WhenIClickOnTheFormsButton()
        {
            if (!BP_DS_HomePageUtilities.ClickFormsButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on the Study button")]
        public void WhenIClickOnTheStudyButton()
        {
            if (!DS_BP_StudyProperties.ClickMenuStudyButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see error messages as below")]
        [When(@"I see error messages as below")]
        public void WhenISeeErrorMessagesAsBelow(Table table)
        {
            IEnumerable<StudyVerificationErrorsData> data = table.CreateSet<StudyVerificationErrorsData>();
            if (!BP_DS_StudyVerificationMessagesUtilities.VerifyErrors((List<StudyVerificationErrorsData>)data))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see error warning messages as below")]
        [When(@"I see error warning messages as below")]
        public void WhenISeeErrorWarningMessagesAsBelow(Table table)
        {
            IEnumerable<StudyVerificationErrorsData> data = table.CreateSet<StudyVerificationErrorsData>();
            if (!BP_DS_StudyVerificationMessagesUtilities.VerifyErrorWarnings((List<StudyVerificationErrorsData>)data))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should see the domain NewDomain items with the updated codelist value")]
        public void ThenIShouldSeeTheDomainNewDomainItemsWithTheUpdatedCodelistValue()
        {
            if (!DomainsUtilities.DomainPage())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [Then(@"I see warning messages as below")]
        [When(@"I see warning messages as below")]
        public void WhenISeeWarningMessagesAsBelow(Table table)
        {
            IEnumerable<StudyVerificationWarningsData> data = table.CreateSet<StudyVerificationWarningsData>();
            if (!BP_DS_StudyVerificationMessagesUtilities.VerifyWarnings((List<StudyVerificationWarningsData>)data))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"select the radio button Question Hidden for parent question")]
        public void WhenSelectTheRadioButtonQuestionHiddenForParentQuestion()
        {
            if (!FormQuestionsUtilities.QuestionHiddenRadioButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"select the radio button None for parent question")]
        public void WhenSelectTheRadioButtonNoneForParentQuestion()
        {
            if (!FormQuestionsUtilities.QuestionNoneRadioButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I do not see error messages as below")]
        [When(@"I do not see error messages as below")]
        public void WhenIDoNotSeeErrorMessagesAsBelow(Table table)
        {
            IEnumerable<StudyVerificationErrorsData> data = table.CreateSet<StudyVerificationErrorsData>();
            if (!BP_DS_StudyVerificationMessagesUtilities.NotDisplayErrors((List<StudyVerificationErrorsData>)data))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"select all processes check box")]
        public void WhenSelectAllProcessesCheckBox()
        {
            if (!DS_BP_StudyProperties.CheckAllProcessesCheckBox())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"select all code lists items check box")]
        public void WhenSelectAllCodeListsItemsCheckBox()
        {
            if (!CodeListsUtilities.AllCodeListItemsCheck())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"verify the Messages popup having title ""(.*)"" and do not display message ""(.*)""")]
        public void WhenVerifyTheMessagesPopupHavingTitleAndDoNotDisplayMessage(string p0, string p1)
        {
            ScenarioContext.Current.Pending();
        }

        [When(@"click on delete button")]
        public void WhenClickOnDeleteButton()
        {
            if (!DS_BP_StudyProperties.ClickDeleteButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I import a study ""(.*)""")]
       
        public void WhenIImportAStudy(string studyFileName)
        {
            if (!BP_DS_HomePageUtilities.ImportAStudy(studyFileName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

     

        [Then(@"I should see the message ""(.*)"" beside Client/Sponsor.")]
        public void ThenIShouldSeeTheMessageBesideClientSponsor(string message)
        {
            if (!BP_DS_ImportStudyUtilities.VerifyMessageAtSponsor(message))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
       
        }


        [When(@"enter LabDictionaryName as ""(.*)""")]
        public void WhenEnterLabDictionaryNameAs(string labDictName)
        {
            if (!ManageLabsUtilities.SetLabDictName(labDictName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"enter CodeDesc as ""(.*)""")]
        public void WhenEnterCodeDescAs(string labDictName)
        {
            if (!CodeListsUtilities.SetCodeDesc(labDictName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"enter CodeValue as ""(.*)""")]
        public void WhenEnterCodeValueAs(string labDictName)
        {
            if (!CodeListsUtilities.SetCodeValue(labDictName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"enter CodelistName as ""(.*)""")]
        [When(@"I enter CodelistName as ""(.*)""")]
        public void WhenEnterCodelistNameAs(string codeListName)
        {
            if (!CodeListsUtilities.SetCodeListName(codeListName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"enter DomainName as ""(.*)""")]
        public void WhenEnterDomainNameAs(string domainName)
        {
            if (!DomainsUtilities.SetDomainName(domainName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"enter Linkage Name as ""(.*)""")]
        public void WhenEnterLinkageNameAs(string linkageName)
        {
            if (!CodelistsGroupUtilities.SetLinkageName(linkageName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"enter LinkageDesc as ""(.*)""")]
        public void WhenEnterLinkageDescAs(string linkageDesc)
        {
            if (!CodelistsGroupUtilities.SetLinkageDesc(linkageDesc))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"select primary codelist as ""(.*)""")]
        public void WhenSelectPrimaryCodelistAs(string primarycodelist)
        {
            if (!CodelistsGroupUtilities.SelectPrimaryCodelist(primarycodelist))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"select secondary codelist as ""(.*)""")]
        public void WhenSelectSecondaryCodelistAs(string secondarycodelist)
        {
            if (!CodelistsGroupUtilities.SelectSecondaryCodelist(secondarycodelist))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"enter DomainDesc as ""(.*)""")]
        public void WhenEnterDomainDescAs(string domainDesc)
        {
            if (!DomainsUtilities.SetDomainDesc(domainDesc))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        //[When(@"I enter FormName as ""(.*)""")]
        //public void WhenIEnterFormNameAs(string formName)
        //{
        //    if (!FormUtilities.SetFormName(formName))
        //    {
        //        ScenarioContext.Current["ActResult"] = "Failed";
        //    }
        //}

        //[When(@"I enter FormLabel as ""(.*)""")]
        //public void WhenIEnterFormLabelAs(string formLabel)
        //{
        //    if (!FormUtilities.SetFormlabel(formLabel))
        //    {
        //        ScenarioContext.Current["ActResult"] = "Failed";
        //    }
        //}

        //[When(@"I click on the Form Save button")]
        //public void WhenIClickOnTheFormSaveButton()
        //{
        //    if (!FormUtilities.FormSaveButton())
        //    {
        //        ScenarioContext.Current["ActResult"] = "Failed";
        //    }
        //}


        [When(@"enter CodelistDesc as ""(.*)""")]
        [When(@"I enter CodelistDesc as ""(.*)""")]
        public void WhenEnterCodelistDescAs(string codeListDesc)
        {
            if (!CodeListsUtilities.SetCodeListDesc(codeListDesc))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"enter LabDictionaryDesc as ""(.*)""")]
        public void WhenEnterLabDictionaryDescAs(string labDictDesc)
        {
            if (!ManageLabsUtilities.SetLabDictDesc(labDictDesc))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I should not see Modal Popup on the screen")]
        public void ThenIShouldNotSeeModalPopupOnTheScreen()
        {
            if (ManageLabsUtilities.VerifyDisplayModalPopup())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I upload a labDict file ""(.*)""")]
        public void WhenIUploadALabDictFile(string ladDistFile)
        {
            if (!ManageLabsUtilities.UploadDictFile(ladDistFile))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on the Save button in Study Properties page")]
        [When(@"I click on the Save button")]
        [Then (@"I click on the Save button")]
        public void WhenIClickOnTheSaveButton()
        {
            if (!BP_DS_ImportStudyUtilities.ClickSaveButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
             }
            
            if(!BP_DS_ImportStudyUtilities.HandlethePopup())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }                
           
        }

        [When(@"I click on the Lab Dict Save button")]
        public void WhenIClickOnTheLabDictSaveButton()
        {
            if (!ManageLabsUtilities.LabDictSaveButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on the Codelist Save button")]
        public void WhenIClickOnTheCodelistSaveButton()
        {
            if (!CodeListsUtilities.CodeListSaveButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on the CodelistItem Save button")]
        public void WhenIClickOnTheCodelistItemSaveButton()
        {
            if (!CodeListsUtilities.CodeListItemSaveButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on the CodelistGroup Save button")]
        public void WhenIClickOnTheCodelistGroupSaveButton()
        {
            if (!CodelistsGroupUtilities.CodeListGroupItemSaveButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on the Domains Save button")]
        public void WhenIClickOnTheDomainsSaveButton()
        {
            if (!DomainsUtilities.DomainSaveButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on the Linkage Save button")]
        public void WhenIClickOnTheLinkageSaveButton()
        {
            if (!DomainsUtilities.DomainSaveButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"click on Labmapping Save button")]
        public void WhenClickOnLabmappingSaveButton()
        {
            if (!DS_LabMappingUtilities.LamMappingSaveButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select the form domain name ""(.*)""")]
        [When(@"I select the Autobuild form domain ""(.*)""")]
        public void WhenISelectTheAutobuildFormDomain(string domainName)
        {
            if (!FormQuestionsUtilities.SelectAutobuildFormDomain(domainName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"select autobuild table domainname ""(.*)""")]
        public void WhenSelectAutobuildTableDomainname(string domainName)
        {
            if (!FormQuestionsUtilities.SelectAutobuildtableDomainname(domainName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select autobuild table domain name as ""(.*)""")]
        public void WhenISelectAutobuildTableDomainNameAs(string domainName)
        {
            if (!FormQuestionsUtilities.SelectAutobuildtableDomainName(domainName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"Click Save&Next button")]
        public void WhenClickSaveNextButton()
        {
            if (!FormQuestionsUtilities.ClickSaveAndNextButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"Click on Save&Next button")]
        public void WhenClickOnSaveNextButton()
        {
            if (!FormQuestionsUtilities.AutoBuildClickSaveAndNextButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"select item name as ""(.*)""")]
        public void WhenSelectItemNameAs(string itemName)
        {
            if (!FormQuestionsUtilities.SelectAutobuildFormItemName(itemName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"enter values as ""(.*)""")]
        [When(@"Enter the unique study name ""(.*)""")]
        public void WhenEnterTheUniqueStudyName(string studyName)
        {
            if (!DS_BP_StudyProperties.SetStudyName(studyName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"Select the sponsor name ""(.*)""")]
        public void WhenSelectTheSponsorName(string sponsorName)
        {
            if (!DS_BP_StudyProperties.SelectItemFromDropdown(sponsorName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"Select the LabDict name ""(.*)""")]
        public void WhenSelectTheLabDictName(string labDictName)
        {
            if (!MapLabDictUtilities.SelectLabDictItem(labDictName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I click on the link LabUnit")]
        public void WhenIClickOnTheLinkLabUnit()
        {
            if (!MapLabDictUtilities.ClickOnLabUnitTab())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }



        [When(@"Select the Code Value for LabTest ""(.*)""")]
        public void WhenSelectTheCodeValueForLabTest(string labTestCodeValue)
        {
            if (!MapLabDictUtilities.SelectLabTestCodeValueItem(labTestCodeValue))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"Select the Code Value for second LabTest ""(.*)""")]
        public void WhenSelectTheCodeValueForSecondLabTest(string labTestCodeValue)
        {
            if (!MapLabDictUtilities.SelectLabTestCodeValueSecondItem(labTestCodeValue))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"Select the Code Value for LabUnit ""(.*)""")]
        public void WhenSelectTheCodeValueForLabUnit(string labUnitCodeValue)
        {
            if (!MapLabDictUtilities.SelectLabUnitCodeValueItem(labUnitCodeValue))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I see the lab unit mapping ""(.*)""")]
        public void ThenISeeTheLabUnitMapping(string labUnit)
        {
            if (!MapLabDictUtilities.VerifyTheLabUnitMapping(labUnit))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"Select the Code Value for Second LabUnit ""(.*)""")]
        public void WhenSelectTheCodeValueForSecondLabUnit(string labUnitCodeValue)
        {
            if (!MapLabDictUtilities.SelectLabUnitCodeValueSecondItem(labUnitCodeValue))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on the tab Lab Mapping")]
        public void WhenIClickOnTheTabLabMapping()
        {
            if (!DS_LabMappingUtilities.ClickLabMappingTab())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on map lab dict Save button")]
        [When(@"I click lab dict Save button")]
        public void WhenIClickLabDictSaveButton()
        {
            if (!MapLabDictUtilities.labDictSaveButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on the CodeList item ""(.*)""")]
        public void WhenIClickOnTheCodeListItem(string codeListItem)
        {
            if (!CodeListsUtilities.ClickCodeListsLink(codeListItem))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"I click continue in verify study popup having title ""(.*)"" and partial message ""(.*)""")]
        [When(@"I click continue in confirmation having title ""(.*)"" and partial message ""(.*)""")]
        public void WhenIClickContinueInConfirmationHavingTitleAndPartialMessage(string titleText, string messageText_Partial)
        {
            if (!DS_BP_ConfirmationPopupUtilities.ClickContinue(titleText, messageText_Partial))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click Continue in Delete Jobs popup having title ""(.*)"" and partial message ""(.*)""")]
        [When(@"I click Continue on Target App pop up having  title ""(.*)"" and partial message ""(.*)""")]
        public void WhenIClickContinueInDeleteJobsPopupHavingTitleAndPartialMessage(string titleText, string messageText_Partial)
        {
            if (!DS_BP_ConfirmationPopupUtilities.DeleteJobsContinue(titleText, messageText_Partial))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"I click Yes in Delete popup having title ""(.*)"" and partial message ""(.*)""")]
        public void WhenIClickYesInDeletePopupHavingTitleAndPartialMessage(string headerText, string codeListsItemsDeleteMessage)
        {
            if (!CodeListsUtilities.ClickYes(headerText, codeListsItemsDeleteMessage))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"verify the Messages popup having title ""(.*)"" and partial message ""(.*)"" and click on the error link ""(.*)""")]
        public void WhenVerifyTheMessagesPopupHavingTitleAndPartialMessageAndClickOnTheErrorLink(string popupTitle, string errorMessage, string linkName)
        {
            if (!DS_BP_ConfirmationPopupUtilities.VerifyandClickErrorLink(popupTitle, errorMessage, linkName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I Study file should be downloaded and the status of the study ""(.*)"" in ""(.*)"" state")]
        [Then(@"I should see the status of the study ""(.*)"" in ""(.*)"" state")]
        [When(@"I should see the status of the study ""(.*)"" in ""(.*)"" state")]
        public void WhenIShouldSeeTheStatusOfTheStudyInState(string processName, string status)
        {
            if (!StudyManagementJobsUtilities.VerifyJobStatus(processName, status))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on study publish continue button")]
        public void WhenIClickOnStudyPublishContinueButton()
        {
            if (!BP_DS_LabMappingsSpecificationDialog.StudyPublishContinueButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I Click ""(.*)""")]
        public void WhenIClick(string labDict)
        {
            if (!ManageLabsUtilities.AddLabDictionary(labDict))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I Click on ""(.*)"" for deletion")]
        public void WhenIClickOnForDeletion(string labDict)
        {
            if (!ManageLabsUtilities.DeleteLabDictionary(labDict))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"I Click on ""(.*)"" to add new Domain")]
        public void WhenIClickOnToAddNewDomain(string newDomain)
        {
            if (!DomainsUtilities.AddNewDomain(newDomain))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I Click on ""(.*)"" to add new CodelistGroup")]
        public void WhenIClickOnToAddNewCodelistGroup(string newDomain)
        {
            if (!CodelistsGroupUtilities.AddNewCodelistGroup(newDomain))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"enter GroupName as ""(.*)""")]
        public void WhenEnterGroupNameAs(string GroupName)
        {
            
           ScenarioContext.Current["CodelistName"] = CodelistsGroupUtilities.SetGroupName(GroupName);
            
        }

        [When(@"enter GroupDesc as ""(.*)""")]
        public void WhenEnterGroupDescAs(string GroupDesc)
        {
            if (!CodelistsGroupUtilities.SetGroupDesc(GroupDesc))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I Click ""(.*)"" to add domain items")]
        public void WhenIClickToAddDomainItems(string newDomainItem)
        {
            if (!DomainsUtilities.AddNewDomainItem(newDomainItem))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I update domain item details and each time when i update record updated message should be displayed")]
        [Then(@"I update domain item details and each time when i update record updated message should be displayed")]
        [Then(@"I update domain item details and each time when i update record updated message ""(.*)"" should be displayed")]
        [When(@"I update domain item details and each time when i update record updated message ""(.*)"" should be displayed")]
        public void WhenIUpdateDomainItemDetailsAndEachTimeWhenIUpdateRecordUpdatedMessageShouldBeDisplayed(Table domainitemsdata)
        {
            List<String> domainItemDetailsList = new List<String>();
            if (!DomainsUtilities.UpdateDomainItemDetails(domainitemsdata.CreateSet<DomainItemsData>(), out domainItemDetailsList))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enter domain item details and each time when i add a new record success message should be displayed")]
        [Then(@"I enter domain item details and each time when i add a new record success message should be displayed")]
        [Then(@"I enter domain item details and each time when i add a new record message ""(.*)"" should be displayed")]
        [When(@"I enter domain item details and each time when i add a new record message ""(.*)"" should be displayed")]
        [When(@"I enter domain item details and each time when I add a new record success message should be displayed")]
        public void WhenIEnterDomainItemDetailsAndEachTimeWhenIAddANewRecordMessageShouldBeDisplayed(Table domainitemsdata)
        {
            List<String> domainItemDetailsList = new List<String>();
            if (!DomainsUtilities.AddNewDomainItemDetails(domainitemsdata.CreateSet<DomainItemsData>(), out domainItemDetailsList))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I should see the DomainItems in Domain page")]
        public void ThenIShouldSeeTheDomainItemsInDomainPage(Table table)
        {
            // List<String> domainItemDetailsList = new List<String>();
            IEnumerable<DomainItemsData> data = table.CreateSet<DomainItemsData>();
            if (!DomainsUtilities.SearchDomainItemDetails((List<DomainItemsData>)data))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enter domain item details")]
        public void WhenIEnterDomainItemDetails(Table domainitemsdata)
        {
            //List<String> domainItemDetailsList = new List<String>();
            //if (!DomainsUtilities.AddNewDomainItemDetails(domainitemsdata.CreateSet<DomainItemsData>(), out domainItemDetailsList))
            //{
            //    ScenarioContext.Current["ActResult"] = "Failed";
            //}
        }


        [When(@"I Click on CodeList item ""(.*)""")]
        public void WhenIClickOnCodeListItem(string codeListItem)
        {
            if (!CodeListsUtilities.AddCodeListItem(codeListItem))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"I Click on ""(.*)""")]
        public void WhenIClickOn(string codeList)
        {
            if (!CodeListsUtilities.AddCodeList(codeList))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"I click on ""(.*)"" link")]
        public void WhenIClickOnLink(string deleteItemsLink)
        {
            if (!CodeListsUtilities.DeleteItesmLink(deleteItemsLink))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"Click on the Codelist ""(.*)""")]
        public void WhenClickOnTheCodelist(string codeListName)
        {
            if (!CodeListsUtilities.ClickCodelist(codeListName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"Click on the Domain ""(.*)""")]
        [When(@"I Click on the Domain ""(.*)""")]
        public void WhenClickOnTheDomain(string domainName)
        {
            if (!DomainsUtilities.ClickDomainList(domainName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"Click on the linkage link ""(.*)""")]
        public void WhenClickOnTheLinkageLink(string linkageName)
        {
            if (!CodelistsGroupUtilities.ClickLinkageLink(linkageName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"Click on the CodelistGroup ""(.*)""")]
        public void WhenClickOnTheCodeListGroup(string groupName)
        {
           // groupName = ScenarioContext.Current["CodelistName"].ToString();
            if (!CodelistsGroupUtilities.ClickGrouplink(groupName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select the Codelist ""(.*)"" that we want to assign to group")]
        public void WhenISelectTheCodelistThatWeWantToAssignToGroup(string codeList)
        {
            if (!CodelistsGroupUtilities.SelectCodelist(codeList))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"Click on the LabDict ""(.*)""")]
        public void WhenClickOnTheLabDict(string labDictName)
        {
            if (!ManageLabsUtilities.ClickLabDict(labDictName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"Click on the link ""(.*)""")]
        public void WhenClickOnTheLink(string labDictName)
        {
            if (!StudyManagementJobsUtilities.ClickProcessLink(labDictName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"Click on the image ""(.*)"" link")]
        public void WhenClickOnTheImageLink(string importLabDict)
        {
            if (!ManageLabsUtilities.ImportLabDictionary(importLabDict))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"Enter Label as ""(.*)""")]
        public void WhenEnterLabelAs(string labDictLabel)
        {
            if (!ManageLabsUtilities.LabDictionaryLabel(labDictLabel))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"enter codeprefix as ""(.*)""")]
        public void WhenEnterCodeprefixAs(int p0)
        {
            if (!CodeListsUtilities.CodePrefix(p0))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"click breadcrumb item ""(.*)""")]
        [Then(@"I click breadcrumb item ""(.*)""")]
        [When(@"I click breadcrumb item ""(.*)""")]
        public void ThenIClickBreadcrumbItem(string breadCrumbItemText)
        {
            if (!StudyManagementJobsUtilities.ClickBreadCrumbItem(breadCrumbItemText))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on the form ""(.*)""")]
        public void WhenIClickOnTheForm(string newForm)
        {
            if (!StudyManagementJobsUtilities.ClickProcessLink(newForm))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should see below lab tests in the table")]
        public void ThenIShouldSeeBelowLabTestsInTheTable(Table table)
        {
            IEnumerable<LabDictData> LabTestName = table.CreateSet<LabDictData>();
            if (!ManageLabsUtilities.LabTestsinTable((List<LabDictData>)LabTestName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select the below items for autobuild table and click on Save&Close button")]
        [When(@"I select the below items for flat questions")]
        public void WhenISelectTheBelowItemsForFlatQuestions(Table table)
        {
            //IEnumerable<FormQuestionsData> QuestionData = table.CreateSet<FormQuestionsData>();
            //if (!FormQuestionsUtilities.SetQuestionsData((List<FormQuestionsData>)QuestionData))
            //{
            //    ScenarioContext.Current["ActResult"] = "Failed";
            //}
        }

        [Then(@"I see the Lab test ""(.*)"" in table of Lab Dictionary")]
        public void ThenISeeTheLabTestInTableOfLabDictionary(string labTestName)
        {
            if (!ManageLabsUtilities.VerifyDataInTable(labTestName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I see the form questions page ""(.*)""")]
        [Then(@"I should see the form questions page ""(.*)""")]
        public void ThenIShouldSeeTheFormQuestionsPage(string formName)
        {
            if (!FormQuestionsUtilities.VerifyFormName(formName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on the form question parent ""(.*)""")]
        public void WhenIClickOnTheFormQuestionParent(string parentQuestion)
        {
            if (!FormQuestionsUtilities.ClickFormParentQuestionsLink(parentQuestion))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"select the parent question as ""(.*)""")]
        public void WhenSelectTheParentQuestionAs(string checkBoxitem)
        {
            if (!FormQuestionsUtilities.SelectPortalDropdownCheckboxItem(checkBoxitem))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"select the Item name ""(.*)"", comparator as ""(.*)"" and values as ""(.*)"" to the parent question")]
        public void WhenSelectTheItemNameComparatorAsAndValuesAsToTheParentQuestion(string itemName, string comparator, string value)
        {
            if (!FormQuestionsUtilities.Conditionalitems(itemName, comparator, value))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"select the Item name ""(.*)""")]
        public void WhenSelectTheItemName(string conditionalItem)
        {
            if (!FormQuestionsUtilities.SelectPortalDropdownConditionalItem(conditionalItem))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on the Save button in question")]
        public void WhenIClickOnTheSaveButtonInQuestion()
        {
            if (!FormQuestionsUtilities.ClickSaveButtonOnQuestionTab())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"select the source as ""(.*)""")]
        public void WhenSelectTheSourceAs(string sourceItem)
        {
            if (!FormQuestionsUtilities.SelectSourceItem(sourceItem))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"enter the max len value as ""(.*)""")]
        public void WhenEnterTheMaxLenValueAs(int p0)
        {
            ScenarioContext.Current.Pending();
        }

        [When(@"select the Datatype as ""(.*)""")]
        public void WhenSelectTheDatatypeAs(string datatypeItem)
        {
            if (!FormQuestionsUtilities.SelectDatatypeItem(datatypeItem))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"click on the add button for the newdomain")]
        public void WhenClickOnTheAddButtonForTheNewdomain()
        {
           
            if (!DS_LabMappingUtilities.NewDomain())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select Domain Name as ""(.*)""")]
        [When(@"select Lab Mapping DomainName ""(.*)""")]
        public void WhenSelectLabMappingDomainName(string domainName)
        {
            if (!DS_LabMappingUtilities.SelectLabMappingDomain(domainName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select Domain Name as ""(.*)"" in question")]
        public void WhenSelectDomainNameForQuestion(string domainName)
        {
            if (!FormQuestionsUtilities.SelectDomainInQuestion(domainName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enter the Domain ""(.*)"" in table name")]
        public void WhenIEnterTheDomainInTableName(string domainName)
        {
            if (!FormQuestionsUtilities.SelectDomainInTableName(domainName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        
                [When(@"I declare Header name as ""(.*)""")]
        public void WhenIDeclareHeaderNameAs(string HeaderName)
        {
            if (!FormUtilities.SetHeaderDataInQuestion(HeaderName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        
        [When(@"I click on autobuild checkBox")]
        public void WhenIClickOnAutobuildCheckBox()
        {
            if (!FormUtilities.ClickAutoBuildCheckBox())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        
        [When(@"I enter the keySequence as ""(.*)""")]
        public void WhenIEnterTheKeySequenceAs(String KeySequence)
        {
            if (!FormQuestionsUtilities.SelectKeySequenceInQuestion(KeySequence))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I Enter the tablename as ""(.*)""")]
        public void WhenIEnterTheTablenameAs(string TableName)
        {
            if (!FormQuestionsUtilities.EnterTableName(TableName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I click on ""(.*)"" button")]
        public void ThenIClickOnButton(String p0)
        {
            if (!FormQuestionsUtilities.ClickSaveAndNextButtonInTable())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }



        [When(@"select LabId ""(.*)""")]
        public void WhenSelectLabId(string labID)
        {
            if (!DS_LabMappingUtilities.SelectLabIDItem(labID))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When (@"I select Domain Item for Lab ID as ""(.*)"" for Domain ""(.*)""")]
        public void ThenISelectDomainItemForLabIDAsForDomain(string DomainItem, string Domain)
        {
            if (!DS_LabMappingUtilities.SelectLabIDItemForDomain(DomainItem, Domain))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I see that all the characters for Domain Name ""(.*)""and in Domain Item ""(.*)"" are visible\.")]
        public void ThenISeeThatAllTheCharactersForDomainNameAndInDomainItemAreVisible_(string DomainName, string ItemName)
        {
            if (!DS_LabMappingUtilities.ValidateLengthOfControl(DomainName, ItemName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Given(@"I  am on Lab Mappings page, Lab mappings tab")]
        public void GivenIAmOnLabMappingsPageLabMappingsTab()
        {
            if (!DS_LabMappingUtilities.ValidateUserIsOnLabMappingsTab())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"The Laboratory Section should get Expanded")]
        [Then(@"I see that all the sections get expanded")]
        [Then(@"I should see Expand/Collapse Option for all Lab Mappings is Selected\.")]
        public void ThenIShouldSeeExpandCollapseOptionForAllLabMappingsIsSelected()
        { 
            if (!DS_LabMappingUtilities.VerifyExpandCollapseForAllSectionsIsExpanded())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"The Laboratory Section should get Collapsed")]
        [Then(@"I see that all the sections get collapsed")]
        public void ThenISeeThatAllTheSectionsGetCollapsed()
        {
            if (DS_LabMappingUtilities.VerifyExpandCollapseForAllSectionsIsExpanded())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }



        [When(@"I click on Expand/Collapse Option for all Sections")]
        public void WhenIClickOnExpandCollapgeButtonForAllSections()
        {
            if (!Control_ActionUtilities.Click(LabMappingsPage.ExpandCollapseAllButton, "Expand/collapse button cannot be found"))
             {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"Each Section should have Expand/Collapse Button")]
        public void ThenEachSectionShouldHaveExpandCollapseButton()
        {
            if (!DS_LabMappingUtilities.VerifyExpandCollapsePresentForEachSection())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click Expand/Collape button for Section ""(.*)""")]
        public void WhenIClickExpandCollapeButtonForSection(String SectionName)
        {
            if (!DS_LabMappingUtilities.ClickExpandCollapse(SectionName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

         [When(@"select CRF Collection Date ""(.*)""")]
        public void WhenSelectCRFCollectionDate(string crfCollectionDate)
        {
            if (!DS_LabMappingUtilities.SelectcrfCollectionDateItem(crfCollectionDate))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"select the codelist item ""(.*)"" check box")]
        public void WhenSelectTheCodelistItemCheckBox(string codelistItem)
        {
            if (!CodeListsUtilities.ClickCodeListItemsCheckBox(codelistItem))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"select CRF LabTestName ""(.*)""")]
        public void WhenSelectCRFLabTestName(string crfLabTestName)
        {
            if (!DS_LabMappingUtilities.SelectcrfLabTestNameItem(crfLabTestName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"select CRF LabValue ""(.*)""")]
        public void WhenSelectCRFLabValue(string crfLabValue)
        {
            if (!DS_LabMappingUtilities.SelectcrfLabValueItem(crfLabValue))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"select CRF LabUnit ""(.*)""")]
        public void WhenSelectCRFLabUnit(string crfLabUnit)
        {
            if (!DS_LabMappingUtilities.SelectcrfLabUnit(crfLabUnit))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"select the comparator ""(.*)""")]
        public void WhenSelectTheComparator(string comparatorItem)
        {
            if (!FormQuestionsUtilities.SelectPortalDropdownComparatorItem(comparatorItem))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"select keysequence ""(.*)"" to the table child question")]
        public void WhenSelectKeysequenceToTheTableChildQuestion(string keysequence)
        {
            if (!FormQuestionsUtilities.SelectKeySequenceItem(keysequence))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"select keysequence ""(.*)"" to the autobuild table child question")]
        public void WhenSelectKeysequenceToTheAutobuildTableChildQuestion(int p0)
        {
            if (!FormQuestionsUtilities.SelectPortalDropdownKeySequenceItem(p0))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"enter values ""(.*)"" to the parent question")]
        public void WhenEnterValuesToTheParentQuestion(string value)
        {
            if (!FormQuestionsUtilities.SetValue(value))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"enter headername ""(.*)""")]
        public void WhenEnterHeadername(string headerName)
        {
            if (!FormQuestionsUtilities.SetHeaderName(headerName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"select the ""(.*)"" for the parent question")]
        public void WhenSelectTheForTheParentQuestion(string dataGroupName)
        {
            if (!FormQuestionsUtilities.SelectDataGroupItem(dataGroupName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"click on form question saveNext button")]
        public void WhenClickOnFormQuestionSaveNextButton()
        {
            if (!FormQuestionsUtilities.FormQuestionSaveNext())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"click on form question save button")]
        public void WhenClickOnFormQuestionSaveButton()
        {
            if (!FormQuestionsUtilities.FormQuestionSave())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"click on save button")]
        public void WhenClickOnSaveButton()
        {
            if (!CodelistsGroupUtilities.SaveButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"click on single record save button")]
        public void WhenClickOnSingleRecordSaveButton()
        {
            if (!MapLabDictUtilities.RecordSave())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"select the codelist group ""(.*)"" and codelist linkage ""(.*)"" to the child question")]
        public void WhenSelectTheCodelistGroupAndCodelistLinkageToTheChildQuestion(string codelistGroup, string codelistLinkage)
        {
            if (!FormQuestionsUtilities.SelectGroupLinkageItem(codelistGroup, codelistLinkage))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"select the codelist group ""(.*)""")]
        public void WhenSelectTheCodelistGroup(string codelistGroup)
        {
            if (!FormQuestionsUtilities.SelectCodelistGroup(codelistGroup))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"select the codelist linkage ""(.*)""")]
        public void WhenSelectTheCodelistLinkage(string codelistLinkage)
        {
            if (!FormQuestionsUtilities.SelectCodelistLinkage(codelistLinkage))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"select the codelist linkage item ""(.*)"" to the child question")]
        public void WhenSelectTheCodelistLinkageItemToTheChildQuestion(string codelistLinkageItem)
        {
            if (!FormQuestionsUtilities.SelectCodelistLinkageItem(codelistLinkageItem))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"click on the child question ""(.*)""")]
        public void WhenClickOnTheChildQuestion(string childQuestion)
        {
            if (!FormQuestionsUtilities.ClickFormChildQuestionsLink(childQuestion))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"click on the autobuild child question ""(.*)""")]
        public void WhenClickOnTheAutobuildChildQuestion(string autoBuildChildQuestion)
        {
            if (!FormQuestionsUtilities.ClickFormAutoBuildChildQuestionsLink(autoBuildChildQuestion))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"enter headername as ""(.*)"" and select keysequence as ""(.*)"" to the autobuild table child question")]
        public void WhenEnterHeadernameAsAndSelectKeysequenceAsToTheAutobuildTableChildQuestion(string headerName, int p0)
        {
            if (!FormQuestionsUtilities.KeySequenceItems(headerName, 1))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I map lab items to domain items")]
        public void WhenIMapLabItemsToDomainItems(Table domainItemsList)
        {
            List<String> failSiteList = new List<String>();
            if (!DS_LabMappingUtilities.MapDomainItems(domainItemsList.CreateSet<LadMappingData>(), out failSiteList))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I should see labs attribute in the study compare report")]
        public void ThenIShouldSeeLabsAttributeInTheStudyCompareReport()
        {
            //if (!Control_PropertyUtilities.IsControlVisible(DS_Labs.LabsAttribute))
            //{
            //    ScenarioContext.Current["ActResult"] = "Failed";
            //}
        }

        [Then(@"I see Map Lab Dictionary page and breadcrumb items in order")]
        [Then(@"I should see the Compare Study page and breadcrumb in order")]
        [Then(@"I see Parent question properties page and breadcrumb items in order")]
        [When(@"I see Parent question properties page and breadcrumb items in order")]
        public void WhenISeeParentQuestionPropertiesPageAndBreadcrumbItemsInOrder(Table table)
        {
            IEnumerable<BreadCrumbData> data = table.CreateSet<BreadCrumbData>();
            if (!DS_BP_BreadCrumbUtilities.VerifyBreadCrumbFullPath((List<BreadCrumbData>)data))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I click on the study verify error link")]
        [When(@"I click on the study verify error link")]
        public void WhenIClickOnTheStudyVerifyErrorLink()
        {
            if (!HeaderStudyVerifyErrorUtilities.ClickHeaderStudyVerifyErrorLink())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"uncheck Structure Fixed check box")]
        public void WhenUncheckStructureFixedCheckBox()
        {
            if (!FormQuestionsUtilities.UnCheckStructueFixedcheckbox())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"check Structure Fixed check box")]
        public void WhencheckStructureFixedCheckBox()
        {
            if (!FormQuestionsUtilities.CheckStructueFixedcheckbox())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"click on save and close button")]
        public void WhenClickOnSaveAndCloseButton()
        {
            if (!FormQuestionsUtilities.AuotBuildSaveAndCloseButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"click on ""(.*)""")]
        public void WhenClickOn(string p0)
        {

            if (!BP_DS_LabMappingsSpecificationDialog.StudyPublishContinueButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }

        }

        [Then(@"I should see the file name as ""(.*)""")]
        public void ThenIShouldSeeTheFileNameAs(string fileName)
        {
            string path = @"C: \Users\SomaV\Downloads\" + fileName;
            Thread.Sleep(10000);
            Console.WriteLine(fileName);
            if (!(File.Exists(path)))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
            
        }
        [Then(@"I downloaded the file to ""(.*)"" and unzip the folder")]
        public void ThenIDownloadedTheFileToAndUnzipTheFolder(string p0)
        {
            //if (BP_DS_ImportStudyUtilities.DownloadStudyFile(p0).Equals(null))
        //    {
        //        ScenarioContext.Current["ActResult"] = "Failed";
        //    }
            //if (!BP_DS_ImportStudyUtilities.DownloadStudyFile(p0))
            //{
                ScenarioContext.Current["FolderPath"] = BP_DS_ImportStudyUtilities.DownloadStudyFile(p0);
            //}
                      
        }
        [Then(@"I should not see ""(.*)"" file in the folder")]
        public void ThenIShouldNotSeeFileInTheFolder(string fileName)
        {
            string folderpath1 = (string)ScenarioContext.Current["FolderPath"];
            BP_DS_ImportStudyUtilities.SearchForTheFile(fileName, folderpath1 );
           
        }

        [When(@"I should see the domain value as ""(.*)""")]
        public void WhenIShouldSeeTheDomainValueAs(string ExpectedDomain)
        {
            if (!(ExpectedDomain.Equals(FormQuestionsUtilities.GetDomainDataInQuestion())))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I see the link ""(.*)""")]
        public void WhenISeeTheLink(string link)
        {
            if (!(FormQuestionsUtilities.VerifyLinkAvailable(link))) 
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I should see one of the item in the domain as '(.*)'")]
        public void WhenIShouldSeeOneOfTheItemInTheDomainAs(string ItemName)
        {
            if (!(FormQuestionsUtilities.VerifyItemAvailableInDomain(ItemName)))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }

        }



        [When(@"I should see the domain value as ""(.*)"" in table name")]
        public void WhenIShouldSeeTheDomainValueAsInTableName(string ExpectedDomain)
        {
            if (!(ExpectedDomain.Equals(FormQuestionsUtilities.GetDomainDataInTable())))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"I should see the domain item as ""(.*)""")]
        public void WhenIShouldSeeTheDomainItemAs(string ExpectedDomainItem)
        {
            if (!(ExpectedDomainItem.Equals(FormQuestionsUtilities.GetDomainItemDataInQuestion())))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I should see the codelist name as ""(.*)""")]
        public void WhenIShouldSeeTheCodelistNameAs(string ExpectedCodelist)
        {
            if (!(ExpectedCodelist.Equals(FormQuestionsUtilities.GetCodelistDataInQuestion())))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I should see the table name as ""(.*)""")]
        public void WhenIShouldSeeTheTableNameAs(string ExpectedTableName)
        {
            if (!(ExpectedTableName.Equals(FormQuestionsUtilities.GetTableNameInTable())))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I should see the table prompt as ""(.*)""")]
        public void WhenIShouldSeeTheTablePromptAs(string TablePromptInTable)
        {
            if (!(TablePromptInTable.Equals(FormQuestionsUtilities.GetTablePromptInTable())))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }



        [When(@"I should see the Header Name as ""(.*)""")]
        public void WhenIShouldSeeTheHeaderNameAs(string ExpectedHeader)
        {
            if (!(ExpectedHeader.Equals(FormQuestionsUtilities.GetHeaderDataInQuestion())))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I should see the KeySequence as ""(.*)""")]
        public void ThenIShouldSeeTheKeySequenceAs(string ExpectedKeySequence)
        {
            if (!(ExpectedKeySequence.Equals(FormQuestionsUtilities.GetKeySequenceInQuestion())))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I should see the Autobuild checkbox is ""(.*)""")]
        public void WhenIShouldSeeTheAutobuildCheckboxIs(string CheckStatus)
        {
            if (!(FormQuestionsUtilities.VerifyAutoBuildCheckBox(CheckStatus)))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


    }
}
