//
//  NJROTC_AppViewController.m
//  NJROTC App
//
//  Created by Alexander Ramirez on 8/2/10.
//  Copyright Tryad 2011. All rights reserved.
//

#import "NJROTC_AppViewController.h"

#define BACKGROUND 0
#define CHAINOFCOMMANDNUM 1
#define RIBBONSNUM 2
#define RANKSNUM 3
#define UNIFORMINFONUM 4
#define MISCNUM 5
#define RIBBONBARNUM 6
#define CREDITSNUM 7

#define RIBBONINFONUM 0
#define RIBBONMAKERNUM 1

@implementation NJROTC_AppViewController
@synthesize Background,Backbutton,ScrollView,AD;
//Main Screen Stuff
@synthesize Main;
@synthesize Inspection_Knowledge,Ribbon_Bar_Maker,Credits;
@synthesize Inspection_KnowledgeLabel,Ribbon_Bar_MakerLabel,CreditsLabel;
//Inspection Knowledge Screen Stuff
@synthesize Chain_of_Command,Ribbons,Ranks,Uniform_Info,Misc;
@synthesize Chain_of_CommandLabel,RibbonsLabel,RanksLabel,Uniform_InfoLabel,MiscLabel;
//Chain of Command Stuff
@synthesize President,VicePres,SecState,SecDef,SecNavy,Chairman,CNO,Commandant,MCPON,SergeantMajor,NETC,NSTC,Director;
@synthesize PresidentLabel,VicePresLabel,SecStateLabel,SecDefLabel,SecNavyLabel,ChairmanLabel,CNOLabel,CommandantLabel,MCPONLabel,SergeantMajorLabel,NETCLabel,NSTCLabel,DirectorLabel;
//Ribbons Stuff
@synthesize MeritoriousAchievement,DistinguishedUnit,DistinguishedCadet,HonorCadet,CadetAchievement,Aptitude,NavalScienceIVOutstandingCadet,NavalScienceIIIOutstandingCadet,NavalScienceIIOutstandingCadet,NavalScienceIOutstandingCadet,ExemplaryConduct,AcademicAward,ExemplaryPersonalAppereance,PhysicalFitness,Participation,UnitService,CommunityService,DrillTeam,ColorGuard,RifleTeam,Orienteering,Recruiting,MiniBootCamp,SeaCruise;
//Ranks Stuff
@synthesize NJROTCRates,NJROTCRanks,NavyRates,NavyRanks,MarineCorpsRates,MarineCorpsRanks;
@synthesize NJROTCRatesLabel,NJROTCRanksLabel,NavyRatesLabel,NavyRanksLabel,MarineCorpsRatesLabel,MarineCorpsRanksLabel;
//Uniform Info Stuff
@synthesize MaleGrooming,FemaleGrooming,UniformComposition,AwardsAndDecorations,DevicePlacement;
@synthesize MaleGroomingLabel,FemaleGroomingLabel,UniformCompositionLabel,AwardsAndDecorationsLabel,DevicePlacementLabel;
//Misc Stuff
@synthesize GeneralOrders,ImportantDates,Drill,TypesOfCommands,MiscKnowledge,NavyTerminology,PhoneticAlphabet;
@synthesize GeneralOrdersLabel,ImportantDatesLabel,DrillLabel,TypesOfCommandsLabel,MiscKnowledgeLabel,NavyTerminologyLabel,PhoneticAlphabetLabel;
//Ribbon Maker Stuff
@synthesize Forwardbutton,MeritoriousAchievementSelected,DistinguishedUnitSelected,DistinguishedCadetSelected,HonorCadetSelected,CadetAchievementSelected,AptitudeSelected,NavalScienceIVOutstandingCadetSelected,NavalScienceIIIOutstandingCadetSelected,NavalScienceIIOutstandingCadetSelected,NavalScienceIOutstandingCadetSelected,ExemplaryConductSelected,AcademicAwardSelected,ExemplaryPersonalAppereanceSelected,PhysicalFitnessSelected,ParticipationSelected,UnitServiceSelected,CommunityServiceSelected,DrillTeamSelected,ColorGuardSelected,RifleTeamSelected,OrienteeringSelected,RecruitingSelected,MiniBootCampSelected,SeaCruiseSelected;

NSInteger backgroundState=0;
NSInteger ribbons=0;

NSArray *arryData;

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
	return image;
}

- (void)moveBannerViewOffscreen {
	CGRect newBannerFrame = self.AD.frame;
	newBannerFrame.origin.y = self.view.frame.size.height;
	self.AD.frame = newBannerFrame;
}

- (void)moveBannerViewOnscreen {
	CGRect newBannerFrame = self.AD.frame;
	newBannerFrame.origin.y = self.view.frame.size.height-newBannerFrame.size.height;
	[UIView beginAnimations:@"BannerViewIntro" context:NULL];
	self.AD.frame = newBannerFrame;
	[UIView commitAnimations];
}

- (void)AD:(ADBannerView *)bannerdidFailToReceiveAdWithError:(NSError *)error {
	[self moveBannerViewOffscreen];
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner {
	if(Main.hidden==NO)
	{
		[self moveBannerViewOnscreen];
	}
}

/*
 Hides the main screen, the one that pops up when the app is first loaded.
 This includes any animation removing it from the screen.
 */
- (void)hideMainScreen {
	Main.hidden=YES;
	Inspection_Knowledge.hidden=YES;
	Ribbon_Bar_Maker.hidden=YES;
	Credits.hidden=YES;
	Inspection_KnowledgeLabel.hidden=YES;
	Ribbon_Bar_MakerLabel.hidden=YES;
	CreditsLabel.hidden=YES;
	Backbutton.hidden=NO;
	ScrollView.hidden=YES;
	[self moveBannerViewOffscreen];
}

/*
 Shows the main screen, the one that pops up when the app is first loaded.
 This includes any animation putting it on the screen.
 */
- (void)showMainScreen {
	Main.hidden=NO;
	Inspection_Knowledge.hidden=NO;
	Ribbon_Bar_Maker.hidden=NO;
	Credits.hidden=NO;
	Inspection_KnowledgeLabel.hidden=NO;
	Ribbon_Bar_MakerLabel.hidden=NO;
	CreditsLabel.hidden=NO;
	Backbutton.hidden=YES;
	ScrollView.hidden=YES;
	[self moveBannerViewOnscreen];
}

/*
 Hides the inspection knowledge screen, the one that leads to all the inspection knowledge.
 This includes any animation removing it from the screen.
 */
- (void)hideInspectionKnowledge {
	Chain_of_Command.hidden=YES;
	Ribbons.hidden=YES;
	Ranks.hidden=YES;
	Uniform_Info.hidden=YES;
	Misc.hidden=YES;
	Chain_of_CommandLabel.hidden=YES;
	RibbonsLabel.hidden=YES;
	RanksLabel.hidden=YES;
	Uniform_InfoLabel.hidden=YES;
	MiscLabel.hidden=YES;
	ScrollView.hidden=YES;
}

/*
 Shows the inspection knowledge screen, the one that leads to all the inspection knowledge.
 This includes any animation putting it on the screen.
 */
- (void)showInspectionKnowledge {
	Chain_of_Command.hidden=NO;
	Ribbons.hidden=NO;
	Ranks.hidden=NO;
	Uniform_Info.hidden=NO;
	Misc.hidden=NO;
	Chain_of_CommandLabel.hidden=NO;
	RibbonsLabel.hidden=NO;
	RanksLabel.hidden=NO;
	Uniform_InfoLabel.hidden=NO;
	MiscLabel.hidden=NO;
	ScrollView.hidden=YES;
}

/*
 Hides the Chain of Command screen, the one that leads to all the inspection knowledge.
 This includes any animation removing it from the screen.
 */
- (void)hideChainofCommand {
	President.hidden=YES;
	VicePres.hidden=YES;
	SecState.hidden=YES;
	SecDef.hidden=YES;
	SecNavy.hidden=YES;
	Chairman.hidden=YES;
	CNO.hidden=YES;
	Commandant.hidden=YES;
	MCPON.hidden=YES;
	SergeantMajor.hidden=YES;
	NETC.hidden=YES;
	NSTC.hidden=YES;
	Director.hidden=YES;
	PresidentLabel.hidden=YES;
	VicePresLabel.hidden=YES;
	SecStateLabel.hidden=YES;
	SecDefLabel.hidden=YES;
	SecNavyLabel.hidden=YES;
	ChairmanLabel.hidden=YES;
	CNOLabel.hidden=YES;
	CommandantLabel.hidden=YES;
	MCPONLabel.hidden=YES;
	SergeantMajorLabel.hidden=YES;
	NETCLabel.hidden=YES;
	NSTCLabel.hidden=YES;
	DirectorLabel.hidden=YES;	
	ScrollView.hidden=NO;
}

/*
 Shows the Chain of Command screen, the one that leads to all the inspection knowledge.
 This includes any animation putting it on the screen.
 */
- (void)showChainofCommand {
	President.hidden=NO;
	VicePres.hidden=NO;
	SecState.hidden=NO;
	SecDef.hidden=NO;
	SecNavy.hidden=NO;
	Chairman.hidden=NO;
	CNO.hidden=NO;
	Commandant.hidden=NO;
	MCPON.hidden=NO;
	SergeantMajor.hidden=NO;
	NETC.hidden=NO;
	NSTC.hidden=NO;
	Director.hidden=NO;
	PresidentLabel.hidden=NO;
	VicePresLabel.hidden=NO;
	SecStateLabel.hidden=NO;
	SecDefLabel.hidden=NO;
	SecNavyLabel.hidden=NO;
	ChairmanLabel.hidden=NO;
	CNOLabel.hidden=NO;
	CommandantLabel.hidden=NO;
	MCPONLabel.hidden=NO;
	SergeantMajorLabel.hidden=NO;
	NETCLabel.hidden=NO;
	NSTCLabel.hidden=NO;
	DirectorLabel.hidden=NO;
	ScrollView.hidden=YES;
}

/*
 Hides the Ribbons screen, the one that leads to all the inspection knowledge.
 This includes any animation removing it from the screen.
 */
- (void)hideRibbons {
	MeritoriousAchievement.hidden=YES;
	DistinguishedUnit.hidden=YES;
	DistinguishedCadet.hidden=YES;
	HonorCadet.hidden=YES;
	CadetAchievement.hidden=YES;
	Aptitude.hidden=YES;
	NavalScienceIVOutstandingCadet.hidden=YES;
	NavalScienceIIIOutstandingCadet.hidden=YES;
	NavalScienceIIOutstandingCadet.hidden=YES;
	NavalScienceIOutstandingCadet.hidden=YES;
	ExemplaryConduct.hidden=YES;
	AcademicAward.hidden=YES;
	ExemplaryPersonalAppereance.hidden=YES;
	PhysicalFitness.hidden=YES;
	Participation.hidden=YES;
	UnitService.hidden=YES;
	CommunityService.hidden=YES;
	DrillTeam.hidden=YES;
	ColorGuard.hidden=YES;
	RifleTeam.hidden=YES;
	Orienteering.hidden=YES;
	Recruiting.hidden=YES;
	MiniBootCamp.hidden=YES;
	SeaCruise.hidden=YES;
	ScrollView.hidden=NO;
}

/*
 Shows the Ribbons screen, the one that leads to all the inspection knowledge.
 This includes any animation putting it on the screen.
 */
- (void)showRibbons {
	MeritoriousAchievement.hidden=NO;
	DistinguishedUnit.hidden=NO;
	DistinguishedCadet.hidden=NO;
	HonorCadet.hidden=NO;
	CadetAchievement.hidden=NO;
	Aptitude.hidden=NO;
	NavalScienceIVOutstandingCadet.hidden=NO;
	NavalScienceIIIOutstandingCadet.hidden=NO;
	NavalScienceIIOutstandingCadet.hidden=NO;
	NavalScienceIOutstandingCadet.hidden=NO;
	ExemplaryConduct.hidden=NO;
	AcademicAward.hidden=NO;
	ExemplaryPersonalAppereance.hidden=NO;
	PhysicalFitness.hidden=NO;
	Participation.hidden=NO;
	UnitService.hidden=NO;
	CommunityService.hidden=NO;
	DrillTeam.hidden=NO;
	ColorGuard.hidden=NO;
	RifleTeam.hidden=NO;
	Orienteering.hidden=NO;
	Recruiting.hidden=NO;
	MiniBootCamp.hidden=NO;
	SeaCruise.hidden=NO;
	ScrollView.hidden=YES;
	ribbons=0;
}

/*
 Hides the Ranks screen, the one that leads to all the inspection knowledge.
 This includes any animation removing it from the screen.
 */
- (void)hideRanks {
	NJROTCRates.hidden=YES;
	NJROTCRanks.hidden=YES;
	NavyRates.hidden=YES;
	NavyRanks.hidden=YES;
	MarineCorpsRates.hidden=YES;
	MarineCorpsRanks.hidden=YES;
	NJROTCRatesLabel.hidden=YES;
	NJROTCRanksLabel.hidden=YES;
	NavyRatesLabel.hidden=YES;
	NavyRanksLabel.hidden=YES;
	MarineCorpsRatesLabel.hidden=YES;
	MarineCorpsRanksLabel.hidden=YES;
	ScrollView.hidden=NO;
}

/*
 Shows the Ranks screen, the one that leads to all the inspection knowledge.
 This includes any animation putting it on the screen.
 */
- (void)showRanks {
	NJROTCRates.hidden=NO;
	NJROTCRanks.hidden=NO;
	NavyRates.hidden=NO;
	NavyRanks.hidden=NO;
	MarineCorpsRates.hidden=NO;
	MarineCorpsRanks.hidden=NO;
	NJROTCRatesLabel.hidden=NO;
	NJROTCRanksLabel.hidden=NO;
	NavyRatesLabel.hidden=NO;
	NavyRanksLabel.hidden=NO;
	MarineCorpsRatesLabel.hidden=NO;
	MarineCorpsRanksLabel.hidden=NO;
	ScrollView.hidden=YES;
}

/*
 Hides the Uniform Info screen, the one that leads to all the inspection knowledge.
 This includes any animation removing it from the screen.
 */
- (void)hideUniformInfo {
	MaleGrooming.hidden=YES;
	FemaleGrooming.hidden=YES;
	UniformComposition.hidden=YES;
	AwardsAndDecorations.hidden=YES;
	DevicePlacement.hidden=YES;
	MaleGroomingLabel.hidden=YES;
	FemaleGroomingLabel.hidden=YES;
	UniformCompositionLabel.hidden=YES;
	AwardsAndDecorationsLabel.hidden=YES;
	DevicePlacementLabel.hidden=YES;
	ScrollView.hidden=NO;
}

/*
 Shows the Uniform Info screen, the one that leads to all the inspection knowledge.
 This includes any animation putting it on the screen.
 */
- (void)showUniformInfo {
	MaleGrooming.hidden=NO;
	FemaleGrooming.hidden=NO;
	UniformComposition.hidden=NO;
	AwardsAndDecorations.hidden=NO;
	DevicePlacement.hidden=NO;
	MaleGroomingLabel.hidden=NO;
	FemaleGroomingLabel.hidden=NO;
	UniformCompositionLabel.hidden=NO;
	AwardsAndDecorationsLabel.hidden=NO;
	DevicePlacementLabel.hidden=NO;	
	ScrollView.hidden=YES;
}

/*
 Hides the Misc screen, the one that leads to all the inspection knowledge.
 This includes any animation removing it from the screen.
 */
- (void)hideMisc {
	GeneralOrders.hidden=YES;
	ImportantDates.hidden=YES;
	Drill.hidden=YES;
	TypesOfCommands.hidden=YES;
	MiscKnowledge.hidden=YES;
	NavyTerminology.hidden=YES;
	PhoneticAlphabet.hidden=YES;	
	GeneralOrdersLabel.hidden=YES;
	ImportantDatesLabel.hidden=YES;
	DrillLabel.hidden=YES;
	TypesOfCommandsLabel.hidden=YES;
	MiscKnowledgeLabel.hidden=YES;
	NavyTerminologyLabel.hidden=YES;
	PhoneticAlphabetLabel.hidden=YES;
	ScrollView.hidden=NO;
}

/*
 Shows the Misc screen, the one that leads to all the inspection knowledge.
 This includes any animation putting it on the screen.
 */
- (void)showMisc {
	GeneralOrders.hidden=NO;
	ImportantDates.hidden=NO;
	Drill.hidden=NO;
	TypesOfCommands.hidden=NO;
	MiscKnowledge.hidden=NO;
	NavyTerminology.hidden=NO;
	PhoneticAlphabet.hidden=NO;	
	GeneralOrdersLabel.hidden=NO;
	ImportantDatesLabel.hidden=NO;
	DrillLabel.hidden=NO;
	TypesOfCommandsLabel.hidden=NO;
	MiscKnowledgeLabel.hidden=NO;
	NavyTerminologyLabel.hidden=NO;
	PhoneticAlphabetLabel.hidden=NO;
	ScrollView.hidden=YES;
}

/*
 Hides the Ribbons Maker selection screen, the one that leads to all the inspection knowledge.
 This includes any animation removing it from the screen.
 */
- (void)hideRibbonsMaker {
	Forwardbutton.hidden=YES;
	MeritoriousAchievement.hidden=YES;
	DistinguishedUnit.hidden=YES;
	DistinguishedCadet.hidden=YES;
	HonorCadet.hidden=YES;
	CadetAchievement.hidden=YES;
	Aptitude.hidden=YES;
	NavalScienceIVOutstandingCadet.hidden=YES;
	NavalScienceIIIOutstandingCadet.hidden=YES;
	NavalScienceIIOutstandingCadet.hidden=YES;
	NavalScienceIOutstandingCadet.hidden=YES;
	ExemplaryConduct.hidden=YES;
	AcademicAward.hidden=YES;
	ExemplaryPersonalAppereance.hidden=YES;
	PhysicalFitness.hidden=YES;
	Participation.hidden=YES;
	UnitService.hidden=YES;
	CommunityService.hidden=YES;
	DrillTeam.hidden=YES;
	ColorGuard.hidden=YES;
	RifleTeam.hidden=YES;
	Orienteering.hidden=YES;
	Recruiting.hidden=YES;
	MiniBootCamp.hidden=YES;
	SeaCruise.hidden=YES;
	MeritoriousAchievementSelected.hidden=YES;
	DistinguishedUnitSelected.hidden=YES;
	DistinguishedCadetSelected.hidden=YES;
	HonorCadetSelected.hidden=YES;
	CadetAchievementSelected.hidden=YES;
	AptitudeSelected.hidden=YES;
	NavalScienceIVOutstandingCadetSelected.hidden=YES;
	NavalScienceIIIOutstandingCadetSelected.hidden=YES;
	NavalScienceIIOutstandingCadetSelected.hidden=YES;
	NavalScienceIOutstandingCadetSelected.hidden=YES;
	ExemplaryConductSelected.hidden=YES;
	AcademicAwardSelected.hidden=YES;
	ExemplaryPersonalAppereanceSelected.hidden=YES;
	PhysicalFitnessSelected.hidden=YES;
	ParticipationSelected.hidden=YES;
	UnitServiceSelected.hidden=YES;
	CommunityServiceSelected.hidden=YES;
	DrillTeamSelected.hidden=YES;
	ColorGuardSelected.hidden=YES;
	RifleTeamSelected.hidden=YES;
	OrienteeringSelected.hidden=YES;
	RecruitingSelected.hidden=YES;
	MiniBootCampSelected.hidden=YES;
	SeaCruiseSelected.hidden=YES;
}

/*
 Shows the Ribbons Maker selection screen, the one that leads to all the inspection knowledge.
 This includes any animation putting it on the screen.
 */
- (void)showRibbonsMaker {
	Background.hidden=NO;
	Forwardbutton.hidden=NO;
	MeritoriousAchievement.hidden=NO;
	DistinguishedUnit.hidden=NO;
	DistinguishedCadet.hidden=NO;
	HonorCadet.hidden=NO;
	CadetAchievement.hidden=NO;
	Aptitude.hidden=NO;
	NavalScienceIVOutstandingCadet.hidden=NO;
	NavalScienceIIIOutstandingCadet.hidden=NO;
	NavalScienceIIOutstandingCadet.hidden=NO;
	NavalScienceIOutstandingCadet.hidden=NO;
	ExemplaryConduct.hidden=NO;
	AcademicAward.hidden=NO;
	ExemplaryPersonalAppereance.hidden=NO;
	PhysicalFitness.hidden=NO;
	Participation.hidden=NO;
	UnitService.hidden=NO;
	CommunityService.hidden=NO;
	DrillTeam.hidden=NO;
	ColorGuard.hidden=NO;
	RifleTeam.hidden=NO;
	Orienteering.hidden=NO;
	Recruiting.hidden=NO;
	MiniBootCamp.hidden=NO;
	SeaCruise.hidden=NO;
	ribbons=1;
}

/*
 Hides the Ribbons Bar screen, the one that leads to all the inspection knowledge.
 This includes any animation removing it from the screen.
 */
- (void)hideRibbonBar {
	Background.hidden=YES;
	Forwardbutton.hidden=YES;
	MeritoriousAchievement.hidden=YES;
	DistinguishedUnit.hidden=YES;
	DistinguishedCadet.hidden=YES;
	HonorCadet.hidden=YES;
	CadetAchievement.hidden=YES;
	Aptitude.hidden=YES;
	NavalScienceIVOutstandingCadet.hidden=YES;
	NavalScienceIIIOutstandingCadet.hidden=YES;
	NavalScienceIIOutstandingCadet.hidden=YES;
	NavalScienceIOutstandingCadet.hidden=YES;
	ExemplaryConduct.hidden=YES;
	AcademicAward.hidden=YES;
	ExemplaryPersonalAppereance.hidden=YES;
	PhysicalFitness.hidden=YES;
	Participation.hidden=YES;
	UnitService.hidden=YES;
	CommunityService.hidden=YES;
	DrillTeam.hidden=YES;
	ColorGuard.hidden=YES;
	RifleTeam.hidden=YES;
	Orienteering.hidden=YES;
	Recruiting.hidden=YES;
	MiniBootCamp.hidden=YES;
	SeaCruise.hidden=YES;
	MeritoriousAchievementSelected.hidden=YES;
	DistinguishedUnitSelected.hidden=YES;
	DistinguishedCadetSelected.hidden=YES;
	HonorCadetSelected.hidden=YES;
	CadetAchievementSelected.hidden=YES;
	AptitudeSelected.hidden=YES;
	NavalScienceIVOutstandingCadetSelected.hidden=YES;
	NavalScienceIIIOutstandingCadetSelected.hidden=YES;
	NavalScienceIIOutstandingCadetSelected.hidden=YES;
	NavalScienceIOutstandingCadetSelected.hidden=YES;
	ExemplaryConductSelected.hidden=YES;
	AcademicAwardSelected.hidden=YES;
	ExemplaryPersonalAppereanceSelected.hidden=YES;
	PhysicalFitnessSelected.hidden=YES;
	ParticipationSelected.hidden=YES;
	UnitServiceSelected.hidden=YES;
	CommunityServiceSelected.hidden=YES;
	DrillTeamSelected.hidden=YES;
	ColorGuardSelected.hidden=YES;
	RifleTeamSelected.hidden=YES;
	OrienteeringSelected.hidden=YES;
	RecruitingSelected.hidden=YES;
	MiniBootCampSelected.hidden=YES;
	SeaCruiseSelected.hidden=YES;
	for(int i=0;i<24;i++) {
		((UIView *) [arryData objectAtIndex:i]).hidden = YES;
	}
}

/*
 What happens when the screen is touched.
 Basically all the navigation stuff in the app.
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	for (UITouch *touch in touches) {
		if (Backbutton.hidden==NO&&CGRectContainsPoint([Backbutton frame], [touch locationInView:self.view])) {
			//For Inspection Knowledge
			if(Chain_of_Command.hidden==NO) {
				[self hideInspectionKnowledge];
				[self showMainScreen];
			}
			//For Chain of Command
			if(President.hidden==NO) {
				[self hideChainofCommand];
				[self showInspectionKnowledge];
			}
			//For Chain of Command Info
			if(backgroundState==1) {
				backgroundState=0;
				[self showChainofCommand];
			}
			//For Ribbons
			if(MeritoriousAchievement.hidden==NO&&ribbons==0) {
				[self hideRibbons];
				[self showInspectionKnowledge];
			}
			//For Ribbons Info
			if(backgroundState==2&&ribbons==0) {
				backgroundState=0;
				[self showRibbons];
			}
			//For Ranks
			if(NJROTCRates.hidden==NO) {
				[self hideRanks];
				[self showInspectionKnowledge];
			}
			//For Ranks Info
			if(backgroundState==3) {
				backgroundState=0;
				[self showRanks];
			}
			//For Uniform Info
			if(MaleGrooming.hidden==NO) {
				[self hideUniformInfo];
				[self showInspectionKnowledge];
			}
			//For Uniform Info Info
			if(backgroundState==4) {
				backgroundState=0;
				[self showUniformInfo];
			}
			//For Misc
			if(GeneralOrders.hidden==NO) {
				[self hideMisc];
				[self showInspectionKnowledge];
			}
			//For Misc Info
			if(backgroundState==5) {
				backgroundState=0;
				[self showMisc];
			}
			//For Ribbons Maker
			if(MeritoriousAchievement.hidden==NO&&ribbons==1) {
				[self hideRibbonsMaker];
				[self showMainScreen];
			}
			//For Ribbon Bar Made
			if(backgroundState==6) {
				backgroundState=0;
				[self hideRibbonBar];
				[self showRibbonsMaker];
			}
			//For Credits
			if(backgroundState==7) {
				backgroundState=0;
				[self showMainScreen];
			}
		}
		//Begin stuff for main screen
		else if (Inspection_Knowledge.hidden==NO&&CGRectContainsPoint([Inspection_Knowledge frame], [touch locationInView:self.view])) {
			[self hideMainScreen];
			[self showInspectionKnowledge];
		}
		else if (Ribbon_Bar_Maker.hidden==NO&&CGRectContainsPoint([Ribbon_Bar_Maker frame], [touch locationInView:self.view])) {
			[self hideMainScreen];
			[self showRibbonsMaker];
		}
		else if (Credits.hidden==NO&&CGRectContainsPoint([Credits frame], [touch locationInView:self.view])) {
			[self hideMainScreen];
			ScrollView.hidden=NO;
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Credits.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=7;
		}
		//End Stuff for main screen
		//Begin stuff for Inspection Knowledge
		else if (Chain_of_Command.hidden==NO&&CGRectContainsPoint([Chain_of_Command frame], [touch locationInView:self.view])) {
			[self hideInspectionKnowledge];
			[self showChainofCommand];
		}
		else if (Ribbons.hidden==NO&&CGRectContainsPoint([Ribbons frame], [touch locationInView:self.view])) {
			[self hideInspectionKnowledge];
			[self showRibbons];
		}
		else if (Ranks.hidden==NO&&CGRectContainsPoint([Ranks frame], [touch locationInView:self.view])) {
			[self hideInspectionKnowledge];
			[self showRanks];
		}
		else if (Uniform_Info.hidden==NO&&CGRectContainsPoint([Uniform_Info frame], [touch locationInView:self.view])) {
			[self hideInspectionKnowledge];
			[self showUniformInfo];
		}
		else if (Misc.hidden==NO&&CGRectContainsPoint([Misc frame], [touch locationInView:self.view])) {
			[self hideInspectionKnowledge];
			[self showMisc];
		}
		//End Stuff for Inspection Knowledge
		//Begin stuff for Chain of Command
		else if (President.hidden==NO&&CGRectContainsPoint([President frame], [touch locationInView:self.view])) {
			[self hideChainofCommand];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"President Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=1;
		}
		else if (VicePres.hidden==NO&&CGRectContainsPoint([VicePres frame], [touch locationInView:self.view])) {
			[self hideChainofCommand];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"VicePres Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=1;
		}
		else if (SecState.hidden==NO&&CGRectContainsPoint([SecState frame], [touch locationInView:self.view])) {
			[self hideChainofCommand];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"SecState Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=1;
		}
		else if (SecDef.hidden==NO&&CGRectContainsPoint([SecDef frame], [touch locationInView:self.view])) {
			[self hideChainofCommand];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"SecDef Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=1;
		}
		else if (SecNavy.hidden==NO&&CGRectContainsPoint([SecNavy frame], [touch locationInView:self.view])) {
			[self hideChainofCommand];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"SecNavy Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=1;
		}
		else if (Chairman.hidden==NO&&CGRectContainsPoint([Chairman frame], [touch locationInView:self.view])) {
			[self hideChainofCommand];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Chairman Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=1;
		}
		else if (CNO.hidden==NO&&CGRectContainsPoint([CNO frame], [touch locationInView:self.view])) {
			[self hideChainofCommand];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CNO Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=1;
		}
		else if (Commandant.hidden==NO&&CGRectContainsPoint([Commandant frame], [touch locationInView:self.view])) {
			[self hideChainofCommand];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Commandant Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=1;
		}
		else if (MCPON.hidden==NO&&CGRectContainsPoint([MCPON frame], [touch locationInView:self.view])) {
			[self hideChainofCommand];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MCPON Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=1;
		}
		else if (SergeantMajor.hidden==NO&&CGRectContainsPoint([SergeantMajor frame], [touch locationInView:self.view])) {
			[self hideChainofCommand];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"SergeantMajor Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=1;
		}
		else if (NETC.hidden==NO&&CGRectContainsPoint([NETC frame], [touch locationInView:self.view])) {
			[self hideChainofCommand];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"NETC Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=1;
		}
		else if (NSTC.hidden==NO&&CGRectContainsPoint([NSTC frame], [touch locationInView:self.view])) {
			[self hideChainofCommand];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"NSTC Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=1;
		}
		else if (Director.hidden==NO&&CGRectContainsPoint([Director frame], [touch locationInView:self.view])) {
			[self hideChainofCommand];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Director Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=1;
		}
		//End Stuff for Chain of Command
		//Begin stuff for Ribbons
		else if (ribbons==0&&MeritoriousAchievement.hidden==NO&&CGRectContainsPoint([MeritoriousAchievement frame], [touch locationInView:self.view])) {
			[self hideRibbons];		
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MeritoriousAchievement Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=2;
		}
		else if (ribbons==0&&DistinguishedUnit.hidden==NO&&CGRectContainsPoint([DistinguishedUnit frame], [touch locationInView:self.view])) {
			[self hideRibbons];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"DistinguishedUnit Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=2;
		}
		else if (ribbons==0&&DistinguishedCadet.hidden==NO&&CGRectContainsPoint([DistinguishedCadet frame], [touch locationInView:self.view])) {
			[self hideRibbons];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"DistinguishedCadet Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=2;
		}
		else if (ribbons==0&&HonorCadet.hidden==NO&&CGRectContainsPoint([HonorCadet frame], [touch locationInView:self.view])) {
			[self hideRibbons];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"HonorCadet Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=2;
		}
		else if (ribbons==0&&CadetAchievement.hidden==NO&&CGRectContainsPoint([CadetAchievement frame], [touch locationInView:self.view])) {
			[self hideRibbons];	
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CadetAchievement Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=2;
		}
		else if (ribbons==0&&Aptitude.hidden==NO&&CGRectContainsPoint([Aptitude frame], [touch locationInView:self.view])) {
			[self hideRibbons];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Aptitude Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=2;
		}
		else if (ribbons==0&&NavalScienceIVOutstandingCadet.hidden==NO&&CGRectContainsPoint([NavalScienceIVOutstandingCadet frame], [touch locationInView:self.view])) {
			[self hideRibbons];	
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"NavalScienceIVOutstandingCadet Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=2;
		}
		else if (ribbons==0&&NavalScienceIIIOutstandingCadet.hidden==NO&&CGRectContainsPoint([NavalScienceIIIOutstandingCadet frame], [touch locationInView:self.view])) {
			[self hideRibbons];	
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"NavalScienceIIIOutstandingCadet Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=2;
		}
		else if (ribbons==0&&NavalScienceIIOutstandingCadet.hidden==NO&&CGRectContainsPoint([NavalScienceIIOutstandingCadet frame], [touch locationInView:self.view])) {
			[self hideRibbons];	
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"NavalScienceIIOutstandingCadet Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=2;
		}
		else if (ribbons==0&&NavalScienceIOutstandingCadet.hidden==NO&&CGRectContainsPoint([NavalScienceIOutstandingCadet frame], [touch locationInView:self.view])) {
			[self hideRibbons];		
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"NavalScienceIOutstandingCadet Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=2;
		}
		else if (ribbons==0&&ExemplaryConduct.hidden==NO&&CGRectContainsPoint([ExemplaryConduct frame], [touch locationInView:self.view])) {
			[self hideRibbons];	
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ExemplaryConduct Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=2;
		}
		else if (ribbons==0&&AcademicAward.hidden==NO&&CGRectContainsPoint([AcademicAward frame], [touch locationInView:self.view])) {
			[self hideRibbons];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"AcademicAward Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=2;
		}
		else if (ribbons==0&&ExemplaryPersonalAppereance.hidden==NO&&CGRectContainsPoint([ExemplaryPersonalAppereance frame], [touch locationInView:self.view])) {
			[self hideRibbons];	
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ExemplaryPersonalAppereance Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=2;
		}
		else if (ribbons==0&&PhysicalFitness.hidden==NO&&CGRectContainsPoint([PhysicalFitness frame], [touch locationInView:self.view])) {
			[self hideRibbons];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"PhysicalFitness Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=2;
		}
		else if (ribbons==0&&Participation.hidden==NO&&CGRectContainsPoint([Participation frame], [touch locationInView:self.view])) {
			[self hideRibbons];	
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Participation Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=2;
		}
		else if (ribbons==0&&UnitService.hidden==NO&&CGRectContainsPoint([UnitService frame], [touch locationInView:self.view])) {
			[self hideRibbons];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"UnitService Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=2;
		}
		else if (ribbons==0&&CommunityService.hidden==NO&&CGRectContainsPoint([CommunityService frame], [touch locationInView:self.view])) {
			[self hideRibbons];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CommunityService Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=2;
		}
		else if (ribbons==0&&DrillTeam.hidden==NO&&CGRectContainsPoint([DrillTeam frame], [touch locationInView:self.view])) {
			[self hideRibbons];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"DrillTeam Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=2;
		}
		else if (ribbons==0&&ColorGuard.hidden==NO&&CGRectContainsPoint([ColorGuard frame], [touch locationInView:self.view])) {
			[self hideRibbons];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ColorGuard Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=2;
		}
		else if (ribbons==0&&RifleTeam.hidden==NO&&CGRectContainsPoint([RifleTeam frame], [touch locationInView:self.view])) {
			[self hideRibbons];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"RifleTeam Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=2;
		}
		else if (ribbons==0&&Orienteering.hidden==NO&&CGRectContainsPoint([Orienteering frame], [touch locationInView:self.view])) {
			[self hideRibbons];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Orienteering Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=2;
		}
		else if (ribbons==0&&Recruiting.hidden==NO&&CGRectContainsPoint([Recruiting frame], [touch locationInView:self.view])) {
			[self hideRibbons];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Recruiting Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=2;
		}
		else if (ribbons==0&&MiniBootCamp.hidden==NO&&CGRectContainsPoint([MiniBootCamp frame], [touch locationInView:self.view])) {
			[self hideRibbons];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MiniBootCamp Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=2;
		}
		else if (ribbons==0&&SeaCruise.hidden==NO&&CGRectContainsPoint([SeaCruise frame], [touch locationInView:self.view])) {
			[self hideRibbons];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"SeaCruise Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=2;
		}
		//End Stuff for Ribbons
		//Begin Stuff for Ranks
		else if (NJROTCRates.hidden==NO&&CGRectContainsPoint([NJROTCRates frame], [touch locationInView:self.view])) {
			[self hideRanks];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"NJROTCRates Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=3;
		}
		else if (NJROTCRanks.hidden==NO&&CGRectContainsPoint([NJROTCRanks frame], [touch locationInView:self.view])) {
			[self hideRanks];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"NJROTCRanks Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=3;
		}
		else if (NavyRates.hidden==NO&&CGRectContainsPoint([NavyRates frame], [touch locationInView:self.view])) {
			[self hideRanks];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"NavyRates Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=3;
		}
		else if (NavyRanks.hidden==NO&&CGRectContainsPoint([NavyRanks frame], [touch locationInView:self.view])) {
			[self hideRanks];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"NavyRanks Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=3;
		}
		else if (MarineCorpsRates.hidden==NO&&CGRectContainsPoint([MarineCorpsRates frame], [touch locationInView:self.view])) {
			[self hideRanks];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MarineCorpsRates Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=3;
		}
		else if (MarineCorpsRanks.hidden==NO&&CGRectContainsPoint([MarineCorpsRanks frame], [touch locationInView:self.view])) {
			[self hideRanks];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MarineCorpsRanks Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=3;
		}
		//End Stuff for Ranks
		//Begin Stuff for Uniform Info
		else if (MaleGrooming.hidden==NO&&CGRectContainsPoint([MaleGrooming frame], [touch locationInView:self.view])) {
			[self hideUniformInfo];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MaleGrooming Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=4;
		}
		else if (FemaleGrooming.hidden==NO&&CGRectContainsPoint([FemaleGrooming frame], [touch locationInView:self.view])) {
			[self hideUniformInfo];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"FemaleGrooming Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=4;
		}
		else if (UniformComposition.hidden==NO&&CGRectContainsPoint([UniformComposition frame], [touch locationInView:self.view])) {
			[self hideUniformInfo];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"UniformComposition Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=4;
		}
		else if (AwardsAndDecorations.hidden==NO&&CGRectContainsPoint([AwardsAndDecorations frame], [touch locationInView:self.view])) {
			[self hideUniformInfo];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"AwardsAndDecorations Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=4;
		}
		else if (DevicePlacement.hidden==NO&&CGRectContainsPoint([DevicePlacement frame], [touch locationInView:self.view])) {
			[self hideUniformInfo];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"DevicePlacement Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=4;
		}
		//End Stuff for Uniform Info
		//Begin Stuff for Misc Info
		else if (GeneralOrders.hidden==NO&&CGRectContainsPoint([GeneralOrders frame], [touch locationInView:self.view])) {
			[self hideMisc];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"GeneralOrders Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=5;
		}
		else if (ImportantDates.hidden==NO&&CGRectContainsPoint([ImportantDates frame], [touch locationInView:self.view])) {
			[self hideMisc];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ImportantDates Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=5;
		}
		else if (Drill.hidden==NO&&CGRectContainsPoint([Drill frame], [touch locationInView:self.view])) {
			[self hideMisc];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Drill Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=5;
		}
		else if (TypesOfCommands.hidden==NO&&CGRectContainsPoint([TypesOfCommands frame], [touch locationInView:self.view])) {
			[self hideMisc];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"TypesOfCommands Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=5;
		}
		else if (MiscKnowledge.hidden==NO&&CGRectContainsPoint([MiscKnowledge frame], [touch locationInView:self.view])) {
			[self hideMisc];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MiscKnowledge Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=5;
		}
		else if (NavyTerminology.hidden==NO&&CGRectContainsPoint([NavyTerminology frame], [touch locationInView:self.view])) {
			[self hideMisc];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"NavyTerminology Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=5;
		}
		else if (PhoneticAlphabet.hidden==NO&&CGRectContainsPoint([PhoneticAlphabet frame], [touch locationInView:self.view])) {
			[self hideMisc];
			image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"PhoneticAlphabet Info.png"]];
			image.hidden=NO;
			[[ScrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
			ScrollView.contentSize = image.frame.size;
			ScrollView.minimumZoomScale = ScrollView.frame.size.width/image.frame.size.width;
			ScrollView.maximumZoomScale = ScrollView.minimumZoomScale;
			[ScrollView addSubview:image];
			[ScrollView setZoomScale:ScrollView.minimumZoomScale];
			backgroundState=5;
		}
		//End Stuff for Misc Info
		//Begin stuff for Ribbon Maker
		else if (Forwardbutton.hidden==NO&&CGRectContainsPoint([Forwardbutton frame], [touch locationInView:self.view])) {
			//Find out how many there are
			int num=0;
			if(MeritoriousAchievementSelected.hidden==NO) {
				num++;
			}
			if(DistinguishedUnitSelected.hidden==NO) {
				num++;
			}
			if(DistinguishedCadetSelected.hidden==NO) {
				num++;
			}
			if(HonorCadetSelected.hidden==NO) {
				num++;
			}
			if(CadetAchievementSelected.hidden==NO) {
				num++;
			}
			if(AptitudeSelected.hidden==NO) {
				num++;
			}
			if(NavalScienceIVOutstandingCadetSelected.hidden==NO) {
				num++;
			}
			if(NavalScienceIIIOutstandingCadetSelected.hidden==NO) {
				num++;
			}
			if(NavalScienceIIOutstandingCadetSelected.hidden==NO) {
				num++;
			}
			if(NavalScienceIOutstandingCadetSelected.hidden==NO) {
				num++;
			}
			if(ExemplaryConductSelected.hidden==NO) {
				num++;
			}
			if(AcademicAwardSelected.hidden==NO) {
				num++;
			}
			if(ExemplaryPersonalAppereanceSelected.hidden==NO) {
				num++;
			}
			if(PhysicalFitnessSelected.hidden==NO) {
				num++;
			}
			if(ParticipationSelected.hidden==NO) {
				num++;
			}
			if(UnitServiceSelected.hidden==NO) {
				num++;
			}
			if(CommunityServiceSelected.hidden==NO) {
				num++;
			}
			if(DrillTeamSelected.hidden==NO) {
				num++;
			}
			if(ColorGuardSelected.hidden==NO) {
				num++;
			}
			if(RifleTeamSelected.hidden==NO) {
				num++;
			}
			if(OrienteeringSelected.hidden==NO) {
				num++;
			}
			if(RecruitingSelected.hidden==NO) {
				num++;
			}
			if(MiniBootCampSelected.hidden==NO) {
				num++;
			}
			if(SeaCruiseSelected.hidden==NO) {
				num++;
			}
			//Add ribbons one by one to the display
			int total=num;
			while(num>0) {
				if(MeritoriousAchievementSelected.hidden==NO) {
					num--;
					[[arryData objectAtIndex:(total-num-1)] setImage:[UIImage imageNamed:@"MeritoriousAchievement.png"]];
					MeritoriousAchievementSelected.hidden=YES;
				}
				else if(DistinguishedUnitSelected.hidden==NO) {
					num--;
					[[arryData objectAtIndex:(total-num-1)] setImage:[UIImage imageNamed:@"DistinguishedUnit.png"]];
					DistinguishedUnitSelected.hidden=YES;
				}
				else if(DistinguishedCadetSelected.hidden==NO) {
					num--;
					[[arryData objectAtIndex:(total-num-1)] setImage:[UIImage imageNamed:@"DistinguishedCadet.png"]];
					DistinguishedCadetSelected.hidden=YES;
				}
				else if(HonorCadetSelected.hidden==NO) {
					num--;
					[[arryData objectAtIndex:(total-num-1)] setImage:[UIImage imageNamed:@"HonorCadet.png"]];
					HonorCadetSelected.hidden=YES;
				}
				else if(CadetAchievementSelected.hidden==NO) {
					num--;
					[[arryData objectAtIndex:(total-num-1)] setImage:[UIImage imageNamed:@"CadetAchievement.png"]];
					CadetAchievementSelected.hidden=YES;
				}
				else if(AptitudeSelected.hidden==NO) {
					num--;
					[[arryData objectAtIndex:(total-num-1)] setImage:[UIImage imageNamed:@"Aptitude.png"]];
					AptitudeSelected.hidden=YES;
				}
				else if(NavalScienceIVOutstandingCadetSelected.hidden==NO) {
					num--;
					[[arryData objectAtIndex:(total-num-1)] setImage:[UIImage imageNamed:@"NavalScienceIVOutstandingCadet.png"]];
					NavalScienceIVOutstandingCadetSelected.hidden=YES;
				}
				else if(NavalScienceIIIOutstandingCadetSelected.hidden==NO) {
					num--;
					[[arryData objectAtIndex:(total-num-1)] setImage:[UIImage imageNamed:@"NavalScienceIIIOutstandingCadet.png"]];
					NavalScienceIIIOutstandingCadetSelected.hidden=YES;
				}
				else if(NavalScienceIIOutstandingCadetSelected.hidden==NO) {
					num--;
					[[arryData objectAtIndex:(total-num-1)] setImage:[UIImage imageNamed:@"NavalScienceIIOutstandingCadet.png"]];
					NavalScienceIIOutstandingCadetSelected.hidden=YES;
				}
				else if(NavalScienceIOutstandingCadetSelected.hidden==NO) {
					num--;
					[[arryData objectAtIndex:(total-num-1)] setImage:[UIImage imageNamed:@"NavalScienceIOutstandingCadet.png"]];
					NavalScienceIOutstandingCadetSelected.hidden=YES;
				}
				else if(ExemplaryConductSelected.hidden==NO) {
					num--;
					[[arryData objectAtIndex:(total-num-1)] setImage:[UIImage imageNamed:@"ExemplaryConduct.png"]];
					ExemplaryConductSelected.hidden=YES;
				}
				else if(AcademicAwardSelected.hidden==NO) {
					num--;
					[[arryData objectAtIndex:(total-num-1)] setImage:[UIImage imageNamed:@"AcademicAward.png"]];
					AcademicAwardSelected.hidden=YES;
				}
				else if(ExemplaryPersonalAppereanceSelected.hidden==NO) {
					num--;
					[[arryData objectAtIndex:(total-num-1)] setImage:[UIImage imageNamed:@"ExemplaryPersonalAppereance.png"]];
					ExemplaryPersonalAppereanceSelected.hidden=YES;
				}
				else if(PhysicalFitnessSelected.hidden==NO) {
					num--;
					[[arryData objectAtIndex:(total-num-1)] setImage:[UIImage imageNamed:@"PhysicalFitness.png"]];
					PhysicalFitnessSelected.hidden=YES;
				}
				else if(ParticipationSelected.hidden==NO) {
					num--;
					[[arryData objectAtIndex:(total-num-1)] setImage:[UIImage imageNamed:@"Participation.png"]];
					ParticipationSelected.hidden=YES;
				}
				else if(UnitServiceSelected.hidden==NO) {
					num--;
					[[arryData objectAtIndex:(total-num-1)] setImage:[UIImage imageNamed:@"UnitService.png"]];
					UnitServiceSelected.hidden=YES;
				}
				else if(CommunityServiceSelected.hidden==NO) {
					num--;
					[[arryData objectAtIndex:(total-num-1)] setImage:[UIImage imageNamed:@"CommunityService.png"]];
					CommunityServiceSelected.hidden=YES;
				}
				else if(DrillTeamSelected.hidden==NO) {
					num--;
					[[arryData objectAtIndex:(total-num-1)] setImage:[UIImage imageNamed:@"DrillTeam.png"]];
					DrillTeamSelected.hidden=YES;
				}
				else if(ColorGuardSelected.hidden==NO) {
					num--;
					[[arryData objectAtIndex:(total-num-1)] setImage:[UIImage imageNamed:@"ColorGuard.png"]];
					ColorGuardSelected.hidden=YES;
				}
				else if(RifleTeamSelected.hidden==NO) {
					num--;
					[[arryData objectAtIndex:(total-num-1)] setImage:[UIImage imageNamed:@"RifleTeam.png"]];
					RifleTeamSelected.hidden=YES;
				}
				else if(OrienteeringSelected.hidden==NO) {
					num--;
					[[arryData objectAtIndex:(total-num-1)] setImage:[UIImage imageNamed:@"Orienteering.png"]];
					OrienteeringSelected.hidden=YES;
				}
				else if(RecruitingSelected.hidden==NO) {
					num--;
					[[arryData objectAtIndex:(total-num-1)] setImage:[UIImage imageNamed:@"Recruiting.png"]];
					RecruitingSelected.hidden=YES;
				}
				else if(MiniBootCampSelected.hidden==NO) {
					num--;
					[[arryData objectAtIndex:(total-num-1)] setImage:[UIImage imageNamed:@"MiniBootCamp.png"]];
					MiniBootCampSelected.hidden=YES;
				}
				else if(SeaCruiseSelected.hidden==NO) {
					num--;
					[[arryData objectAtIndex:(total-num-1)] setImage:[UIImage imageNamed:@"SeaCruise.png"]];
					SeaCruiseSelected.hidden=YES;
				}
			}
			if(total==1) {
				((UIView *) [arryData objectAtIndex:total-1]).center = CGPointMake(160,230);
			}
			else if(total==2) {
				((UIView *) [arryData objectAtIndex:total-2]).center = CGPointMake(110,230);
				((UIView *) [arryData objectAtIndex:total-1]).center = CGPointMake(209,230);
			}
			else if(total==3) {
				((UIView *) [arryData objectAtIndex:total-3]).center = CGPointMake(61,230);
				((UIView *) [arryData objectAtIndex:total-2]).center = CGPointMake(160,230);
				((UIView *) [arryData objectAtIndex:total-1]).center = CGPointMake(259,230);
			}
			else if(total==4) {
				((UIView *) [arryData objectAtIndex:total-4]).center = CGPointMake(160,217);
				((UIView *) [arryData objectAtIndex:total-3]).center = CGPointMake(61,243);
				((UIView *) [arryData objectAtIndex:total-2]).center = CGPointMake(160,243);
				((UIView *) [arryData objectAtIndex:total-1]).center = CGPointMake(259,243);
			}
			else if(total==5) {
				((UIView *) [arryData objectAtIndex:total-5]).center = CGPointMake(110,217);
				((UIView *) [arryData objectAtIndex:total-4]).center = CGPointMake(209,217);
				((UIView *) [arryData objectAtIndex:total-3]).center = CGPointMake(61,243);
				((UIView *) [arryData objectAtIndex:total-2]).center = CGPointMake(160,243);
				((UIView *) [arryData objectAtIndex:total-1]).center = CGPointMake(259,243);
			}
			else if(total==6) {
				((UIView *) [arryData objectAtIndex:total-6]).center = CGPointMake(61,217);
				((UIView *) [arryData objectAtIndex:total-5]).center = CGPointMake(160,217);
				((UIView *) [arryData objectAtIndex:total-4]).center = CGPointMake(259,217);
				((UIView *) [arryData objectAtIndex:total-3]).center = CGPointMake(61,243);
				((UIView *) [arryData objectAtIndex:total-2]).center = CGPointMake(160,243);
				((UIView *) [arryData objectAtIndex:total-1]).center = CGPointMake(259,243);
			}
			else if(total==7) {
				((UIView *) [arryData objectAtIndex:total-7]).center = CGPointMake(160,204);
				((UIView *) [arryData objectAtIndex:total-6]).center = CGPointMake(61,230);
				((UIView *) [arryData objectAtIndex:total-5]).center = CGPointMake(160,230);
				((UIView *) [arryData objectAtIndex:total-4]).center = CGPointMake(259,230);
				((UIView *) [arryData objectAtIndex:total-3]).center = CGPointMake(61,256);
				((UIView *) [arryData objectAtIndex:total-2]).center = CGPointMake(160,256);
				((UIView *) [arryData objectAtIndex:total-1]).center = CGPointMake(259,256);
			}
			else if(total==8) {
				((UIView *) [arryData objectAtIndex:total-8]).center = CGPointMake(110,204);
				((UIView *) [arryData objectAtIndex:total-7]).center = CGPointMake(209,204);
				((UIView *) [arryData objectAtIndex:total-6]).center = CGPointMake(61,230);
				((UIView *) [arryData objectAtIndex:total-5]).center = CGPointMake(160,230);
				((UIView *) [arryData objectAtIndex:total-4]).center = CGPointMake(259,230);
				((UIView *) [arryData objectAtIndex:total-3]).center = CGPointMake(61,256);
				((UIView *) [arryData objectAtIndex:total-2]).center = CGPointMake(160,256);
				((UIView *) [arryData objectAtIndex:total-1]).center = CGPointMake(259,256);
			}
			else if(total==9) {
				((UIView *) [arryData objectAtIndex:total-9]).center = CGPointMake(61,204);
				((UIView *) [arryData objectAtIndex:total-8]).center = CGPointMake(160,204);
				((UIView *) [arryData objectAtIndex:total-7]).center = CGPointMake(259,204);
				((UIView *) [arryData objectAtIndex:total-6]).center = CGPointMake(61,230);
				((UIView *) [arryData objectAtIndex:total-5]).center = CGPointMake(160,230);
				((UIView *) [arryData objectAtIndex:total-4]).center = CGPointMake(259,230);
				((UIView *) [arryData objectAtIndex:total-3]).center = CGPointMake(61,256);
				((UIView *) [arryData objectAtIndex:total-2]).center = CGPointMake(160,256);
				((UIView *) [arryData objectAtIndex:total-1]).center = CGPointMake(259,256);
			}
			else if(total==10) {
				((UIView *) [arryData objectAtIndex:total-10]).center = CGPointMake(160,191);
				((UIView *) [arryData objectAtIndex:total-9]).center = CGPointMake(61,217);
				((UIView *) [arryData objectAtIndex:total-8]).center = CGPointMake(160,217);
				((UIView *) [arryData objectAtIndex:total-7]).center = CGPointMake(259,217);
				((UIView *) [arryData objectAtIndex:total-6]).center = CGPointMake(61,243);
				((UIView *) [arryData objectAtIndex:total-5]).center = CGPointMake(160,243);
				((UIView *) [arryData objectAtIndex:total-4]).center = CGPointMake(259,243);
				((UIView *) [arryData objectAtIndex:total-3]).center = CGPointMake(61,269);
				((UIView *) [arryData objectAtIndex:total-2]).center = CGPointMake(160,269);
				((UIView *) [arryData objectAtIndex:total-1]).center = CGPointMake(259,269);
			}
			else if(total==11) {
				((UIView *) [arryData objectAtIndex:total-11]).center = CGPointMake(110,191);
				((UIView *) [arryData objectAtIndex:total-10]).center = CGPointMake(209,191);
				((UIView *) [arryData objectAtIndex:total-9]).center = CGPointMake(61,217);
				((UIView *) [arryData objectAtIndex:total-8]).center = CGPointMake(160,217);
				((UIView *) [arryData objectAtIndex:total-7]).center = CGPointMake(259,217);
				((UIView *) [arryData objectAtIndex:total-6]).center = CGPointMake(61,243);
				((UIView *) [arryData objectAtIndex:total-5]).center = CGPointMake(160,243);
				((UIView *) [arryData objectAtIndex:total-4]).center = CGPointMake(259,243);
				((UIView *) [arryData objectAtIndex:total-3]).center = CGPointMake(61,269);
				((UIView *) [arryData objectAtIndex:total-2]).center = CGPointMake(160,269);
				((UIView *) [arryData objectAtIndex:total-1]).center = CGPointMake(259,269);
			}
			else if(total==12) {
				((UIView *) [arryData objectAtIndex:total-12]).center = CGPointMake(61,191);
				((UIView *) [arryData objectAtIndex:total-11]).center = CGPointMake(160,191);
				((UIView *) [arryData objectAtIndex:total-10]).center = CGPointMake(259,191);
				((UIView *) [arryData objectAtIndex:total-9]).center = CGPointMake(61,217);
				((UIView *) [arryData objectAtIndex:total-8]).center = CGPointMake(160,217);
				((UIView *) [arryData objectAtIndex:total-7]).center = CGPointMake(259,217);
				((UIView *) [arryData objectAtIndex:total-6]).center = CGPointMake(61,243);
				((UIView *) [arryData objectAtIndex:total-5]).center = CGPointMake(160,243);
				((UIView *) [arryData objectAtIndex:total-4]).center = CGPointMake(259,243);
				((UIView *) [arryData objectAtIndex:total-3]).center = CGPointMake(61,269);
				((UIView *) [arryData objectAtIndex:total-2]).center = CGPointMake(160,269);
				((UIView *) [arryData objectAtIndex:total-1]).center = CGPointMake(259,269);
			}
			else if(total==13) {
				((UIView *) [arryData objectAtIndex:total-13]).center = CGPointMake(160,178);
				((UIView *) [arryData objectAtIndex:total-12]).center = CGPointMake(61,204);
				((UIView *) [arryData objectAtIndex:total-11]).center = CGPointMake(160,204);
				((UIView *) [arryData objectAtIndex:total-10]).center = CGPointMake(259,204);
				((UIView *) [arryData objectAtIndex:total-9]).center = CGPointMake(61,230);
				((UIView *) [arryData objectAtIndex:total-8]).center = CGPointMake(160,230);
				((UIView *) [arryData objectAtIndex:total-7]).center = CGPointMake(259,230);
				((UIView *) [arryData objectAtIndex:total-6]).center = CGPointMake(61,256);
				((UIView *) [arryData objectAtIndex:total-5]).center = CGPointMake(160,256);
				((UIView *) [arryData objectAtIndex:total-4]).center = CGPointMake(259,256);
				((UIView *) [arryData objectAtIndex:total-3]).center = CGPointMake(61,282);
				((UIView *) [arryData objectAtIndex:total-2]).center = CGPointMake(160,282);
				((UIView *) [arryData objectAtIndex:total-1]).center = CGPointMake(259,282);
			}
			else if(total==14) {
				((UIView *) [arryData objectAtIndex:total-14]).center = CGPointMake(110,178);
				((UIView *) [arryData objectAtIndex:total-13]).center = CGPointMake(209,178);
				((UIView *) [arryData objectAtIndex:total-12]).center = CGPointMake(61,204);
				((UIView *) [arryData objectAtIndex:total-11]).center = CGPointMake(160,204);
				((UIView *) [arryData objectAtIndex:total-10]).center = CGPointMake(259,204);
				((UIView *) [arryData objectAtIndex:total-9]).center = CGPointMake(61,230);
				((UIView *) [arryData objectAtIndex:total-8]).center = CGPointMake(160,230);
				((UIView *) [arryData objectAtIndex:total-7]).center = CGPointMake(259,230);
				((UIView *) [arryData objectAtIndex:total-6]).center = CGPointMake(61,256);
				((UIView *) [arryData objectAtIndex:total-5]).center = CGPointMake(160,256);
				((UIView *) [arryData objectAtIndex:total-4]).center = CGPointMake(259,256);
				((UIView *) [arryData objectAtIndex:total-3]).center = CGPointMake(61,282);
				((UIView *) [arryData objectAtIndex:total-2]).center = CGPointMake(160,282);
				((UIView *) [arryData objectAtIndex:total-1]).center = CGPointMake(259,282);
			}
			else if(total==15) {
				((UIView *) [arryData objectAtIndex:total-15]).center = CGPointMake(61,178);
				((UIView *) [arryData objectAtIndex:total-14]).center = CGPointMake(160,178);
				((UIView *) [arryData objectAtIndex:total-13]).center = CGPointMake(259,178);
				((UIView *) [arryData objectAtIndex:total-12]).center = CGPointMake(61,204);
				((UIView *) [arryData objectAtIndex:total-11]).center = CGPointMake(160,204);
				((UIView *) [arryData objectAtIndex:total-10]).center = CGPointMake(259,204);
				((UIView *) [arryData objectAtIndex:total-9]).center = CGPointMake(61,230);
				((UIView *) [arryData objectAtIndex:total-8]).center = CGPointMake(160,230);
				((UIView *) [arryData objectAtIndex:total-7]).center = CGPointMake(259,230);
				((UIView *) [arryData objectAtIndex:total-6]).center = CGPointMake(61,256);
				((UIView *) [arryData objectAtIndex:total-5]).center = CGPointMake(160,256);
				((UIView *) [arryData objectAtIndex:total-4]).center = CGPointMake(259,256);
				((UIView *) [arryData objectAtIndex:total-3]).center = CGPointMake(61,282);
				((UIView *) [arryData objectAtIndex:total-2]).center = CGPointMake(160,282);
				((UIView *) [arryData objectAtIndex:total-1]).center = CGPointMake(259,282);
			}
			else if(total==16) {
				((UIView *) [arryData objectAtIndex:total-16]).center = CGPointMake(160,165);
				((UIView *) [arryData objectAtIndex:total-15]).center = CGPointMake(61,191);
				((UIView *) [arryData objectAtIndex:total-14]).center = CGPointMake(160,191);
				((UIView *) [arryData objectAtIndex:total-13]).center = CGPointMake(259,191);
				((UIView *) [arryData objectAtIndex:total-12]).center = CGPointMake(61,217);
				((UIView *) [arryData objectAtIndex:total-11]).center = CGPointMake(160,217);
				((UIView *) [arryData objectAtIndex:total-10]).center = CGPointMake(259,217);
				((UIView *) [arryData objectAtIndex:total-9]).center = CGPointMake(61,243);
				((UIView *) [arryData objectAtIndex:total-8]).center = CGPointMake(160,243);
				((UIView *) [arryData objectAtIndex:total-7]).center = CGPointMake(259,243);
				((UIView *) [arryData objectAtIndex:total-6]).center = CGPointMake(61,269);
				((UIView *) [arryData objectAtIndex:total-5]).center = CGPointMake(160,269);
				((UIView *) [arryData objectAtIndex:total-4]).center = CGPointMake(259,269);
				((UIView *) [arryData objectAtIndex:total-3]).center = CGPointMake(61,295);
				((UIView *) [arryData objectAtIndex:total-2]).center = CGPointMake(160,295);
				((UIView *) [arryData objectAtIndex:total-1]).center = CGPointMake(259,295);
			}
			else if(total==17) {
				((UIView *) [arryData objectAtIndex:total-17]).center = CGPointMake(110,165);
				((UIView *) [arryData objectAtIndex:total-16]).center = CGPointMake(209,165);
				((UIView *) [arryData objectAtIndex:total-15]).center = CGPointMake(61,191);
				((UIView *) [arryData objectAtIndex:total-14]).center = CGPointMake(160,191);
				((UIView *) [arryData objectAtIndex:total-13]).center = CGPointMake(259,191);
				((UIView *) [arryData objectAtIndex:total-12]).center = CGPointMake(61,217);
				((UIView *) [arryData objectAtIndex:total-11]).center = CGPointMake(160,217);
				((UIView *) [arryData objectAtIndex:total-10]).center = CGPointMake(259,217);
				((UIView *) [arryData objectAtIndex:total-9]).center = CGPointMake(61,243);
				((UIView *) [arryData objectAtIndex:total-8]).center = CGPointMake(160,243);
				((UIView *) [arryData objectAtIndex:total-7]).center = CGPointMake(259,243);
				((UIView *) [arryData objectAtIndex:total-6]).center = CGPointMake(61,269);
				((UIView *) [arryData objectAtIndex:total-5]).center = CGPointMake(160,269);
				((UIView *) [arryData objectAtIndex:total-4]).center = CGPointMake(259,269);
				((UIView *) [arryData objectAtIndex:total-3]).center = CGPointMake(61,295);
				((UIView *) [arryData objectAtIndex:total-2]).center = CGPointMake(160,295);
				((UIView *) [arryData objectAtIndex:total-1]).center = CGPointMake(259,295);
			}
			else if(total==18) {
				((UIView *) [arryData objectAtIndex:total-18]).center = CGPointMake(61,165);
				((UIView *) [arryData objectAtIndex:total-17]).center = CGPointMake(160,165);
				((UIView *) [arryData objectAtIndex:total-16]).center = CGPointMake(259,165);
				((UIView *) [arryData objectAtIndex:total-15]).center = CGPointMake(61,191);
				((UIView *) [arryData objectAtIndex:total-14]).center = CGPointMake(160,191);
				((UIView *) [arryData objectAtIndex:total-13]).center = CGPointMake(259,191);
				((UIView *) [arryData objectAtIndex:total-12]).center = CGPointMake(61,217);
				((UIView *) [arryData objectAtIndex:total-11]).center = CGPointMake(160,217);
				((UIView *) [arryData objectAtIndex:total-10]).center = CGPointMake(259,217);
				((UIView *) [arryData objectAtIndex:total-9]).center = CGPointMake(61,243);
				((UIView *) [arryData objectAtIndex:total-8]).center = CGPointMake(160,243);
				((UIView *) [arryData objectAtIndex:total-7]).center = CGPointMake(259,243);
				((UIView *) [arryData objectAtIndex:total-6]).center = CGPointMake(61,269);
				((UIView *) [arryData objectAtIndex:total-5]).center = CGPointMake(160,269);
				((UIView *) [arryData objectAtIndex:total-4]).center = CGPointMake(259,269);
				((UIView *) [arryData objectAtIndex:total-3]).center = CGPointMake(61,295);
				((UIView *) [arryData objectAtIndex:total-2]).center = CGPointMake(160,295);
				((UIView *) [arryData objectAtIndex:total-1]).center = CGPointMake(259,295);
			}	
			else if(total==19) {
				((UIView *) [arryData objectAtIndex:total-19]).center = CGPointMake(160,155);
				((UIView *) [arryData objectAtIndex:total-18]).center = CGPointMake(61,178);
				((UIView *) [arryData objectAtIndex:total-17]).center = CGPointMake(160,178);
				((UIView *) [arryData objectAtIndex:total-16]).center = CGPointMake(259,178);
				((UIView *) [arryData objectAtIndex:total-15]).center = CGPointMake(61,204);
				((UIView *) [arryData objectAtIndex:total-14]).center = CGPointMake(160,204);
				((UIView *) [arryData objectAtIndex:total-13]).center = CGPointMake(259,204);
				((UIView *) [arryData objectAtIndex:total-12]).center = CGPointMake(61,230);
				((UIView *) [arryData objectAtIndex:total-11]).center = CGPointMake(160,230);
				((UIView *) [arryData objectAtIndex:total-10]).center = CGPointMake(259,230);
				((UIView *) [arryData objectAtIndex:total-9]).center = CGPointMake(61,256);
				((UIView *) [arryData objectAtIndex:total-8]).center = CGPointMake(160,256);
				((UIView *) [arryData objectAtIndex:total-7]).center = CGPointMake(259,256);
				((UIView *) [arryData objectAtIndex:total-6]).center = CGPointMake(61,282);
				((UIView *) [arryData objectAtIndex:total-5]).center = CGPointMake(160,282);
				((UIView *) [arryData objectAtIndex:total-4]).center = CGPointMake(259,282);
				((UIView *) [arryData objectAtIndex:total-3]).center = CGPointMake(61,308);
				((UIView *) [arryData objectAtIndex:total-2]).center = CGPointMake(160,308);
				((UIView *) [arryData objectAtIndex:total-1]).center = CGPointMake(259,308);
			}	
			else if(total==20) {
				((UIView *) [arryData objectAtIndex:total-20]).center = CGPointMake(110,155);
				((UIView *) [arryData objectAtIndex:total-19]).center = CGPointMake(209,155);
				((UIView *) [arryData objectAtIndex:total-18]).center = CGPointMake(61,178);
				((UIView *) [arryData objectAtIndex:total-17]).center = CGPointMake(160,178);
				((UIView *) [arryData objectAtIndex:total-16]).center = CGPointMake(259,178);
				((UIView *) [arryData objectAtIndex:total-15]).center = CGPointMake(61,204);
				((UIView *) [arryData objectAtIndex:total-14]).center = CGPointMake(160,204);
				((UIView *) [arryData objectAtIndex:total-13]).center = CGPointMake(259,204);
				((UIView *) [arryData objectAtIndex:total-12]).center = CGPointMake(61,230);
				((UIView *) [arryData objectAtIndex:total-11]).center = CGPointMake(160,230);
				((UIView *) [arryData objectAtIndex:total-10]).center = CGPointMake(259,230);
				((UIView *) [arryData objectAtIndex:total-9]).center = CGPointMake(61,256);
				((UIView *) [arryData objectAtIndex:total-8]).center = CGPointMake(160,256);
				((UIView *) [arryData objectAtIndex:total-7]).center = CGPointMake(259,256);
				((UIView *) [arryData objectAtIndex:total-6]).center = CGPointMake(61,282);
				((UIView *) [arryData objectAtIndex:total-5]).center = CGPointMake(160,282);
				((UIView *) [arryData objectAtIndex:total-4]).center = CGPointMake(259,282);
				((UIView *) [arryData objectAtIndex:total-3]).center = CGPointMake(61,308);
				((UIView *) [arryData objectAtIndex:total-2]).center = CGPointMake(160,308);
				((UIView *) [arryData objectAtIndex:total-1]).center = CGPointMake(259,308);
			}	
			else if(total==21) {
				((UIView *) [arryData objectAtIndex:total-21]).center = CGPointMake(61,155);
				((UIView *) [arryData objectAtIndex:total-20]).center = CGPointMake(160,155);
				((UIView *) [arryData objectAtIndex:total-19]).center = CGPointMake(259,155);
				((UIView *) [arryData objectAtIndex:total-18]).center = CGPointMake(61,178);
				((UIView *) [arryData objectAtIndex:total-17]).center = CGPointMake(160,178);
				((UIView *) [arryData objectAtIndex:total-16]).center = CGPointMake(259,178);
				((UIView *) [arryData objectAtIndex:total-15]).center = CGPointMake(61,204);
				((UIView *) [arryData objectAtIndex:total-14]).center = CGPointMake(160,204);
				((UIView *) [arryData objectAtIndex:total-13]).center = CGPointMake(259,204);
				((UIView *) [arryData objectAtIndex:total-12]).center = CGPointMake(61,230);
				((UIView *) [arryData objectAtIndex:total-11]).center = CGPointMake(160,230);
				((UIView *) [arryData objectAtIndex:total-10]).center = CGPointMake(259,230);
				((UIView *) [arryData objectAtIndex:total-9]).center = CGPointMake(61,256);
				((UIView *) [arryData objectAtIndex:total-8]).center = CGPointMake(160,256);
				((UIView *) [arryData objectAtIndex:total-7]).center = CGPointMake(259,256);
				((UIView *) [arryData objectAtIndex:total-6]).center = CGPointMake(61,282);
				((UIView *) [arryData objectAtIndex:total-5]).center = CGPointMake(160,282);
				((UIView *) [arryData objectAtIndex:total-4]).center = CGPointMake(259,282);
				((UIView *) [arryData objectAtIndex:total-3]).center = CGPointMake(61,308);
				((UIView *) [arryData objectAtIndex:total-2]).center = CGPointMake(160,308);
				((UIView *) [arryData objectAtIndex:total-1]).center = CGPointMake(259,308);
			}	
			else if(total==22) {
				((UIView *) [arryData objectAtIndex:total-22]).center = CGPointMake(160,142);
				((UIView *) [arryData objectAtIndex:total-21]).center = CGPointMake(61,168);
				((UIView *) [arryData objectAtIndex:total-20]).center = CGPointMake(160,168);
				((UIView *) [arryData objectAtIndex:total-19]).center = CGPointMake(259,168);
				((UIView *) [arryData objectAtIndex:total-18]).center = CGPointMake(61,191);
				((UIView *) [arryData objectAtIndex:total-17]).center = CGPointMake(160,191);
				((UIView *) [arryData objectAtIndex:total-16]).center = CGPointMake(259,191);
				((UIView *) [arryData objectAtIndex:total-15]).center = CGPointMake(61,217);
				((UIView *) [arryData objectAtIndex:total-14]).center = CGPointMake(160,217);
				((UIView *) [arryData objectAtIndex:total-13]).center = CGPointMake(259,217);
				((UIView *) [arryData objectAtIndex:total-12]).center = CGPointMake(61,243);
				((UIView *) [arryData objectAtIndex:total-11]).center = CGPointMake(160,243);
				((UIView *) [arryData objectAtIndex:total-10]).center = CGPointMake(259,243);
				((UIView *) [arryData objectAtIndex:total-9]).center = CGPointMake(61,269);
				((UIView *) [arryData objectAtIndex:total-8]).center = CGPointMake(160,269);
				((UIView *) [arryData objectAtIndex:total-7]).center = CGPointMake(259,269);
				((UIView *) [arryData objectAtIndex:total-6]).center = CGPointMake(61,295);
				((UIView *) [arryData objectAtIndex:total-5]).center = CGPointMake(160,295);
				((UIView *) [arryData objectAtIndex:total-4]).center = CGPointMake(259,295);
				((UIView *) [arryData objectAtIndex:total-3]).center = CGPointMake(61,321);
				((UIView *) [arryData objectAtIndex:total-2]).center = CGPointMake(160,321);
				((UIView *) [arryData objectAtIndex:total-1]).center = CGPointMake(259,321);
			}	
			else if(total==23) {
				((UIView *) [arryData objectAtIndex:total-23]).center = CGPointMake(110,142);
				((UIView *) [arryData objectAtIndex:total-22]).center = CGPointMake(209,142);
				((UIView *) [arryData objectAtIndex:total-21]).center = CGPointMake(61,168);
				((UIView *) [arryData objectAtIndex:total-20]).center = CGPointMake(160,168);
				((UIView *) [arryData objectAtIndex:total-19]).center = CGPointMake(259,168);
				((UIView *) [arryData objectAtIndex:total-18]).center = CGPointMake(61,191);
				((UIView *) [arryData objectAtIndex:total-17]).center = CGPointMake(160,191);
				((UIView *) [arryData objectAtIndex:total-16]).center = CGPointMake(259,191);
				((UIView *) [arryData objectAtIndex:total-15]).center = CGPointMake(61,217);
				((UIView *) [arryData objectAtIndex:total-14]).center = CGPointMake(160,217);
				((UIView *) [arryData objectAtIndex:total-13]).center = CGPointMake(259,217);
				((UIView *) [arryData objectAtIndex:total-12]).center = CGPointMake(61,243);
				((UIView *) [arryData objectAtIndex:total-11]).center = CGPointMake(160,243);
				((UIView *) [arryData objectAtIndex:total-10]).center = CGPointMake(259,243);
				((UIView *) [arryData objectAtIndex:total-9]).center = CGPointMake(61,269);
				((UIView *) [arryData objectAtIndex:total-8]).center = CGPointMake(160,269);
				((UIView *) [arryData objectAtIndex:total-7]).center = CGPointMake(259,269);
				((UIView *) [arryData objectAtIndex:total-6]).center = CGPointMake(61,295);
				((UIView *) [arryData objectAtIndex:total-5]).center = CGPointMake(160,295);
				((UIView *) [arryData objectAtIndex:total-4]).center = CGPointMake(259,295);
				((UIView *) [arryData objectAtIndex:total-3]).center = CGPointMake(61,321);
				((UIView *) [arryData objectAtIndex:total-2]).center = CGPointMake(160,321);
				((UIView *) [arryData objectAtIndex:total-1]).center = CGPointMake(259,321);
			}
			else if(total==24) {
				((UIView *) [arryData objectAtIndex:total-24]).center = CGPointMake(61,142);
				((UIView *) [arryData objectAtIndex:total-23]).center = CGPointMake(160,142);
				((UIView *) [arryData objectAtIndex:total-22]).center = CGPointMake(259,142);
				((UIView *) [arryData objectAtIndex:total-21]).center = CGPointMake(61,168);
				((UIView *) [arryData objectAtIndex:total-20]).center = CGPointMake(160,168);
				((UIView *) [arryData objectAtIndex:total-19]).center = CGPointMake(259,168);
				((UIView *) [arryData objectAtIndex:total-18]).center = CGPointMake(61,191);
				((UIView *) [arryData objectAtIndex:total-17]).center = CGPointMake(160,191);
				((UIView *) [arryData objectAtIndex:total-16]).center = CGPointMake(259,191);
				((UIView *) [arryData objectAtIndex:total-15]).center = CGPointMake(61,217);
				((UIView *) [arryData objectAtIndex:total-14]).center = CGPointMake(160,217);
				((UIView *) [arryData objectAtIndex:total-13]).center = CGPointMake(259,217);
				((UIView *) [arryData objectAtIndex:total-12]).center = CGPointMake(61,243);
				((UIView *) [arryData objectAtIndex:total-11]).center = CGPointMake(160,243);
				((UIView *) [arryData objectAtIndex:total-10]).center = CGPointMake(259,243);
				((UIView *) [arryData objectAtIndex:total-9]).center = CGPointMake(61,269);
				((UIView *) [arryData objectAtIndex:total-8]).center = CGPointMake(160,269);
				((UIView *) [arryData objectAtIndex:total-7]).center = CGPointMake(259,269);
				((UIView *) [arryData objectAtIndex:total-6]).center = CGPointMake(61,295);
				((UIView *) [arryData objectAtIndex:total-5]).center = CGPointMake(160,295);
				((UIView *) [arryData objectAtIndex:total-4]).center = CGPointMake(259,295);
				((UIView *) [arryData objectAtIndex:total-3]).center = CGPointMake(61,321);
				((UIView *) [arryData objectAtIndex:total-2]).center = CGPointMake(160,321);
				((UIView *) [arryData objectAtIndex:total-1]).center = CGPointMake(259,321);
			}
			//Show the new Display
			for (int i=total-1; i>=0; i--) {
				((UIView *) [arryData objectAtIndex:i]).hidden=NO;
			}
			//Remove the last Display
			[self hideRibbonsMaker];
			backgroundState=6;
		}
		else if (ribbons==1&&MeritoriousAchievement.hidden==NO&&CGRectContainsPoint([MeritoriousAchievement frame], [touch locationInView:self.view])) {
			if(MeritoriousAchievementSelected.hidden==YES)
			{
				MeritoriousAchievementSelected.hidden=NO;
			}
			else
			{
				MeritoriousAchievementSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&MeritoriousAchievementSelected.hidden==NO&&CGRectContainsPoint([MeritoriousAchievementSelected frame], [touch locationInView:self.view])) {
			if(MeritoriousAchievementSelected.hidden==YES)
			{
				MeritoriousAchievementSelected.hidden=NO;
			}
			else
			{
				MeritoriousAchievementSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&DistinguishedUnit.hidden==NO&&CGRectContainsPoint([DistinguishedUnit frame], [touch locationInView:self.view])) {
			if(DistinguishedUnitSelected.hidden==YES)
			{
				DistinguishedUnitSelected.hidden=NO;
			}
			else
			{
				DistinguishedUnitSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&DistinguishedUnitSelected.hidden==NO&&CGRectContainsPoint([DistinguishedUnitSelected frame], [touch locationInView:self.view])) {
			if(DistinguishedUnitSelected.hidden==YES)
			{
				DistinguishedUnitSelected.hidden=NO;
			}
			else
			{
				DistinguishedUnitSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&DistinguishedCadet.hidden==NO&&CGRectContainsPoint([DistinguishedCadet frame], [touch locationInView:self.view])) {
			if(DistinguishedCadetSelected.hidden==YES)
			{
				DistinguishedCadetSelected.hidden=NO;
			}
			else
			{
				DistinguishedCadetSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&DistinguishedCadetSelected.hidden==NO&&CGRectContainsPoint([DistinguishedCadetSelected frame], [touch locationInView:self.view])) {
			if(DistinguishedCadetSelected.hidden==YES)
			{
				DistinguishedCadetSelected.hidden=NO;
			}
			else
			{
				DistinguishedCadetSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&HonorCadet.hidden==NO&&CGRectContainsPoint([HonorCadet frame], [touch locationInView:self.view])) {
			if(HonorCadetSelected.hidden==YES)
			{
				HonorCadetSelected.hidden=NO;
			}
			else
			{
				HonorCadetSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&HonorCadetSelected.hidden==NO&&CGRectContainsPoint([HonorCadetSelected frame], [touch locationInView:self.view])) {
			if(HonorCadetSelected.hidden==YES)
			{
				HonorCadetSelected.hidden=NO;
			}
			else
			{
				HonorCadetSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&CadetAchievement.hidden==NO&&CGRectContainsPoint([CadetAchievement frame], [touch locationInView:self.view])) {
			if(CadetAchievementSelected.hidden==YES)
			{
				CadetAchievementSelected.hidden=NO;
			}
			else
			{
				CadetAchievementSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&CadetAchievementSelected.hidden==NO&&CGRectContainsPoint([CadetAchievementSelected frame], [touch locationInView:self.view])) {
			if(CadetAchievementSelected.hidden==YES)
			{
				CadetAchievementSelected.hidden=NO;
			}
			else
			{
				CadetAchievementSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&Aptitude.hidden==NO&&CGRectContainsPoint([Aptitude frame], [touch locationInView:self.view])) {
			if(AptitudeSelected.hidden==YES)
			{
				AptitudeSelected.hidden=NO;
			}
			else
			{
				AptitudeSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&AptitudeSelected.hidden==NO&&CGRectContainsPoint([AptitudeSelected frame], [touch locationInView:self.view])) {
			if(AptitudeSelected.hidden==YES)
			{
				AptitudeSelected.hidden=NO;
			}
			else
			{
				AptitudeSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&NavalScienceIVOutstandingCadet.hidden==NO&&CGRectContainsPoint([NavalScienceIVOutstandingCadet frame], [touch locationInView:self.view])) {
			if(NavalScienceIVOutstandingCadetSelected.hidden==YES)
			{
				NavalScienceIVOutstandingCadetSelected.hidden=NO;
			}
			else
			{
				NavalScienceIVOutstandingCadetSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&NavalScienceIVOutstandingCadetSelected.hidden==NO&&CGRectContainsPoint([NavalScienceIVOutstandingCadetSelected frame], [touch locationInView:self.view])) {
			if(NavalScienceIVOutstandingCadetSelected.hidden==YES)
			{
				NavalScienceIVOutstandingCadetSelected.hidden=NO;
			}
			else
			{
				NavalScienceIVOutstandingCadetSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&NavalScienceIIIOutstandingCadet.hidden==NO&&CGRectContainsPoint([NavalScienceIIIOutstandingCadet frame], [touch locationInView:self.view])) {
			if(NavalScienceIIIOutstandingCadetSelected.hidden==YES)
			{
				NavalScienceIIIOutstandingCadetSelected.hidden=NO;
			}
			else
			{
				NavalScienceIIIOutstandingCadetSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&NavalScienceIIIOutstandingCadetSelected.hidden==NO&&CGRectContainsPoint([NavalScienceIIIOutstandingCadetSelected frame], [touch locationInView:self.view])) {
			if(NavalScienceIIIOutstandingCadetSelected.hidden==YES)
			{
				NavalScienceIIIOutstandingCadetSelected.hidden=NO;
			}
			else
			{
				NavalScienceIIIOutstandingCadetSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&NavalScienceIIOutstandingCadet.hidden==NO&&CGRectContainsPoint([NavalScienceIIOutstandingCadet frame], [touch locationInView:self.view])) {
			if(NavalScienceIIOutstandingCadetSelected.hidden==YES)
			{
				NavalScienceIIOutstandingCadetSelected.hidden=NO;
			}
			else
			{
				NavalScienceIIOutstandingCadetSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&NavalScienceIIOutstandingCadetSelected.hidden==NO&&CGRectContainsPoint([NavalScienceIIOutstandingCadetSelected frame], [touch locationInView:self.view])) {
			if(NavalScienceIIOutstandingCadetSelected.hidden==YES)
			{
				NavalScienceIIOutstandingCadetSelected.hidden=NO;
			}
			else
			{
				NavalScienceIIOutstandingCadetSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&NavalScienceIOutstandingCadet.hidden==NO&&CGRectContainsPoint([NavalScienceIOutstandingCadet frame], [touch locationInView:self.view])) {
			if(NavalScienceIOutstandingCadetSelected.hidden==YES)
			{
				NavalScienceIOutstandingCadetSelected.hidden=NO;
			}
			else
			{
				NavalScienceIOutstandingCadetSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&NavalScienceIOutstandingCadetSelected.hidden==NO&&CGRectContainsPoint([NavalScienceIOutstandingCadetSelected frame], [touch locationInView:self.view])) {
			if(NavalScienceIOutstandingCadetSelected.hidden==YES)
			{
				NavalScienceIOutstandingCadetSelected.hidden=NO;
			}
			else
			{
				NavalScienceIOutstandingCadetSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&ExemplaryConduct.hidden==NO&&CGRectContainsPoint([ExemplaryConduct frame], [touch locationInView:self.view])) {
			if(ExemplaryConductSelected.hidden==YES)
			{
				ExemplaryConductSelected.hidden=NO;
			}
			else
			{
				ExemplaryConductSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&ExemplaryConductSelected.hidden==NO&&CGRectContainsPoint([ExemplaryConductSelected frame], [touch locationInView:self.view])) {
			if(ExemplaryConductSelected.hidden==YES)
			{
				ExemplaryConductSelected.hidden=NO;
			}
			else
			{
				ExemplaryConductSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&AcademicAward.hidden==NO&&CGRectContainsPoint([AcademicAward frame], [touch locationInView:self.view])) {
			if(AcademicAwardSelected.hidden==YES)
			{
				AcademicAwardSelected.hidden=NO;
			}
			else
			{
				AcademicAwardSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&AcademicAwardSelected.hidden==NO&&CGRectContainsPoint([AcademicAwardSelected frame], [touch locationInView:self.view])) {
			if(AcademicAwardSelected.hidden==YES)
			{
				AcademicAwardSelected.hidden=NO;
			}
			else
			{
				AcademicAwardSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&ExemplaryPersonalAppereance.hidden==NO&&CGRectContainsPoint([ExemplaryPersonalAppereance frame], [touch locationInView:self.view])) {
			if(ExemplaryPersonalAppereanceSelected.hidden==YES)
			{
				ExemplaryPersonalAppereanceSelected.hidden=NO;
			}
			else
			{
				ExemplaryPersonalAppereanceSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&ExemplaryPersonalAppereanceSelected.hidden==NO&&CGRectContainsPoint([ExemplaryPersonalAppereanceSelected frame], [touch locationInView:self.view])) {
			if(ExemplaryPersonalAppereanceSelected.hidden==YES)
			{
				ExemplaryPersonalAppereanceSelected.hidden=NO;
			}
			else
			{
				ExemplaryPersonalAppereanceSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&PhysicalFitness.hidden==NO&&CGRectContainsPoint([PhysicalFitness frame], [touch locationInView:self.view])) {
			if(PhysicalFitnessSelected.hidden==YES)
			{
				PhysicalFitnessSelected.hidden=NO;
			}
			else
			{
				PhysicalFitnessSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&PhysicalFitnessSelected.hidden==NO&&CGRectContainsPoint([PhysicalFitnessSelected frame], [touch locationInView:self.view])) {
			if(PhysicalFitnessSelected.hidden==YES)
			{
				PhysicalFitnessSelected.hidden=NO;
			}
			else
			{
				PhysicalFitnessSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&Participation.hidden==NO&&CGRectContainsPoint([Participation frame], [touch locationInView:self.view])) {
			if(ParticipationSelected.hidden==YES)
			{
				ParticipationSelected.hidden=NO;
			}
			else
			{
				ParticipationSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&ParticipationSelected.hidden==NO&&CGRectContainsPoint([ParticipationSelected frame], [touch locationInView:self.view])) {
			if(ParticipationSelected.hidden==YES)
			{
				ParticipationSelected.hidden=NO;
			}
			else
			{
				ParticipationSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&UnitService.hidden==NO&&CGRectContainsPoint([UnitService frame], [touch locationInView:self.view])) {
			if(UnitServiceSelected.hidden==YES)
			{
				UnitServiceSelected.hidden=NO;
			}
			else
			{
				UnitServiceSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&UnitServiceSelected.hidden==NO&&CGRectContainsPoint([UnitServiceSelected frame], [touch locationInView:self.view])) {
			if(UnitServiceSelected.hidden==YES)
			{
				UnitServiceSelected.hidden=NO;
			}
			else
			{
				UnitServiceSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&CommunityService.hidden==NO&&CGRectContainsPoint([CommunityService frame], [touch locationInView:self.view])) {
			if(CommunityServiceSelected.hidden==YES)
			{
				CommunityServiceSelected.hidden=NO;
			}
			else
			{
				CommunityServiceSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&CommunityServiceSelected.hidden==NO&&CGRectContainsPoint([CommunityServiceSelected frame], [touch locationInView:self.view])) {
			if(CommunityServiceSelected.hidden==YES)
			{
				CommunityServiceSelected.hidden=NO;
			}
			else
			{
				CommunityServiceSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&DrillTeam.hidden==NO&&CGRectContainsPoint([DrillTeam frame], [touch locationInView:self.view])) {
			if(DrillTeamSelected.hidden==YES)
			{
				DrillTeamSelected.hidden=NO;
			}
			else
			{
				DrillTeamSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&DrillTeamSelected.hidden==NO&&CGRectContainsPoint([DrillTeamSelected frame], [touch locationInView:self.view])) {
			if(DrillTeamSelected.hidden==YES)
			{
				DrillTeamSelected.hidden=NO;
			}
			else
			{
				DrillTeamSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&ColorGuard.hidden==NO&&CGRectContainsPoint([ColorGuard frame], [touch locationInView:self.view])) {
			if(ColorGuardSelected.hidden==YES)
			{
				ColorGuardSelected.hidden=NO;
			}
			else
			{
				ColorGuardSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&ColorGuardSelected.hidden==NO&&CGRectContainsPoint([ColorGuardSelected frame], [touch locationInView:self.view])) {
			if(ColorGuardSelected.hidden==YES)
			{
				ColorGuardSelected.hidden=NO;
			}
			else
			{
				ColorGuardSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&RifleTeam.hidden==NO&&CGRectContainsPoint([RifleTeam frame], [touch locationInView:self.view])) {
			if(RifleTeamSelected.hidden==YES)
			{
				RifleTeamSelected.hidden=NO;
			}
			else
			{
				RifleTeamSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&RifleTeamSelected.hidden==NO&&CGRectContainsPoint([RifleTeamSelected frame], [touch locationInView:self.view])) {
			if(RifleTeamSelected.hidden==YES)
			{
				RifleTeamSelected.hidden=NO;
			}
			else
			{
				RifleTeamSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&Orienteering.hidden==NO&&CGRectContainsPoint([Orienteering frame], [touch locationInView:self.view])) {
			if(OrienteeringSelected.hidden==YES)
			{
				OrienteeringSelected.hidden=NO;
			}
			else
			{
				OrienteeringSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&OrienteeringSelected.hidden==NO&&CGRectContainsPoint([OrienteeringSelected frame], [touch locationInView:self.view])) {
			if(OrienteeringSelected.hidden==YES)
			{
				OrienteeringSelected.hidden=NO;
			}
			else
			{
				OrienteeringSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&Recruiting.hidden==NO&&CGRectContainsPoint([Recruiting frame], [touch locationInView:self.view])) {
			if(RecruitingSelected.hidden==YES)
			{
				RecruitingSelected.hidden=NO;
			}
			else
			{
				RecruitingSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&RecruitingSelected.hidden==NO&&CGRectContainsPoint([RecruitingSelected frame], [touch locationInView:self.view])) {
			if(RecruitingSelected.hidden==YES)
			{
				RecruitingSelected.hidden=NO;
			}
			else
			{
				RecruitingSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&MiniBootCamp.hidden==NO&&CGRectContainsPoint([MiniBootCamp frame], [touch locationInView:self.view])) {
			if(MiniBootCampSelected.hidden==YES)
			{
				MiniBootCampSelected.hidden=NO;
			}
			else
			{
				MiniBootCampSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&MiniBootCampSelected.hidden==NO&&CGRectContainsPoint([MiniBootCampSelected frame], [touch locationInView:self.view])) {
			if(MiniBootCampSelected.hidden==YES)
			{
				MiniBootCampSelected.hidden=NO;
			}
			else
			{
				MiniBootCampSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&SeaCruise.hidden==NO&&CGRectContainsPoint([SeaCruise frame], [touch locationInView:self.view])) {
			if(SeaCruiseSelected.hidden==YES)
			{
				SeaCruiseSelected.hidden=NO;
			}
			else
			{
				SeaCruiseSelected.hidden=YES;
			}
		}
		else if (ribbons==1&&SeaCruiseSelected.hidden==NO&&CGRectContainsPoint([SeaCruiseSelected frame], [touch locationInView:self.view])) {
			if(SeaCruiseSelected.hidden==YES)
			{
				SeaCruiseSelected.hidden=NO;
			}
			else
			{
				SeaCruiseSelected.hidden=YES;
			}
		}
		//End Stuff for Ribbon Maker*/
	}
}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (ribbons==1&&(self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[self moveBannerViewOnscreen];
	CGRect myImageRect = CGRectMake(0.0f, 0.0f, 99.0f, 26.0f);
	UIImageView *myImage1 = [[UIImageView alloc] initWithFrame:myImageRect];
	UIImageView *myImage2 = [[UIImageView alloc] initWithFrame:myImageRect];
	UIImageView *myImage3 = [[UIImageView alloc] initWithFrame:myImageRect];
	UIImageView *myImage4 = [[UIImageView alloc] initWithFrame:myImageRect];
	UIImageView *myImage5 = [[UIImageView alloc] initWithFrame:myImageRect];
	UIImageView *myImage6 = [[UIImageView alloc] initWithFrame:myImageRect];
	UIImageView *myImage7 = [[UIImageView alloc] initWithFrame:myImageRect];
	UIImageView *myImage8 = [[UIImageView alloc] initWithFrame:myImageRect];
	UIImageView *myImage9 = [[UIImageView alloc] initWithFrame:myImageRect];
	UIImageView *myImage10 = [[UIImageView alloc] initWithFrame:myImageRect];
	UIImageView *myImage11 = [[UIImageView alloc] initWithFrame:myImageRect];
	UIImageView *myImage12 = [[UIImageView alloc] initWithFrame:myImageRect];
	UIImageView *myImage13 = [[UIImageView alloc] initWithFrame:myImageRect];
	UIImageView *myImage14 = [[UIImageView alloc] initWithFrame:myImageRect];
	UIImageView *myImage15 = [[UIImageView alloc] initWithFrame:myImageRect];
	UIImageView *myImage16 = [[UIImageView alloc] initWithFrame:myImageRect];
	UIImageView *myImage17 = [[UIImageView alloc] initWithFrame:myImageRect];
	UIImageView *myImage18 = [[UIImageView alloc] initWithFrame:myImageRect];
	UIImageView *myImage19 = [[UIImageView alloc] initWithFrame:myImageRect];
	UIImageView *myImage20 = [[UIImageView alloc] initWithFrame:myImageRect];
	UIImageView *myImage21 = [[UIImageView alloc] initWithFrame:myImageRect];
	UIImageView *myImage22 = [[UIImageView alloc] initWithFrame:myImageRect];
	UIImageView *myImage23 = [[UIImageView alloc] initWithFrame:myImageRect];
	UIImageView *myImage24 = [[UIImageView alloc] initWithFrame:myImageRect];
	[self.view addSubview:myImage1];
	[self.view addSubview:myImage2];
	[self.view addSubview:myImage3];
	[self.view addSubview:myImage4];
	[self.view addSubview:myImage5];
	[self.view addSubview:myImage6];
	[self.view addSubview:myImage7];
	[self.view addSubview:myImage8];
	[self.view addSubview:myImage9];
	[self.view addSubview:myImage10];
	[self.view addSubview:myImage11];
	[self.view addSubview:myImage12];
	[self.view addSubview:myImage13];
	[self.view addSubview:myImage14];
	[self.view addSubview:myImage15];
	[self.view addSubview:myImage16];
	[self.view addSubview:myImage17];
	[self.view addSubview:myImage18];
	[self.view addSubview:myImage19];
	[self.view addSubview:myImage20];
	[self.view addSubview:myImage21];
	[self.view addSubview:myImage22];
	[self.view addSubview:myImage23];
	[self.view addSubview:myImage24];
	arryData = [[NSArray alloc] initWithObjects:myImage1,myImage2,myImage3,myImage4,myImage5,myImage6,myImage7,myImage8,myImage9,myImage10,myImage11,myImage12,myImage13,myImage14,myImage15,myImage16,myImage17,myImage18,myImage19,myImage20,myImage21,myImage22,myImage23,myImage24,nil];
	UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Background.png"]];
	self.Background = tempImageView;
	[tempImageView release];
	ScrollView.delegate = self;
	ScrollView.backgroundColor = [UIColor colorWithRed:41/255.0 green:46/255.0 blue:89/255.0 alpha:1.0];
	image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Main.png"]];
	ScrollView.contentSize = image.frame.size;
	ScrollView.maximumZoomScale = ScrollView.zoomScale;
	ScrollView.minimumZoomScale = ScrollView.maximumZoomScale;
	[ScrollView addSubview:image];
	ScrollView.hidden=YES;
	[self showMainScreen];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
	[super didReceiveMemoryWarning];

	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	[Background release];
	[Backbutton release];
	[Main release];
	[Inspection_Knowledge release];
	[Ribbon_Bar_Maker release];
	[Credits release];
	[Inspection_KnowledgeLabel release];
	[Ribbon_Bar_MakerLabel release];
	[CreditsLabel release];
	[Chain_of_Command release];
	[Ribbons release];
	[Ranks release];
	[Uniform_Info release];
	[Misc release];
	[Chain_of_CommandLabel release];
	[RibbonsLabel release];
	[RanksLabel release];
	[Uniform_InfoLabel release];
	[MiscLabel release];
	[President release];
	[VicePres release];
	[SecState release];
	[SecDef release];
	[SecNavy release];
	[Chairman release];
	[CNO release];
	[Commandant release];
	[MCPON release];
	[SergeantMajor release];
	[NETC release];
	[NSTC release];
	[Director release];
	[PresidentLabel release];
	[VicePresLabel release];
	[SecStateLabel release];
	[SecDefLabel release];
	[SecNavyLabel release];
	[ChairmanLabel release];
	[CNOLabel release];
	[CommandantLabel release];
	[MCPONLabel release];
	[SergeantMajorLabel release];
	[NETCLabel release];
	[NSTCLabel release];
	[DirectorLabel release];
	[MeritoriousAchievement release];
	[DistinguishedUnit release];
	[DistinguishedCadet release];
	[HonorCadet release];
	[CadetAchievement release];
	[Aptitude release];
	[NavalScienceIVOutstandingCadet release];
	[NavalScienceIIIOutstandingCadet release];
	[NavalScienceIIOutstandingCadet release];
	[NavalScienceIOutstandingCadet release];
	[ExemplaryConduct release];
	[AcademicAward release];
	[ExemplaryPersonalAppereance release];
	[PhysicalFitness release];
	[Participation release];
	[UnitService release];
	[CommunityService release];
	[DrillTeam release];
	[ColorGuard release];
	[RifleTeam release];
	[Orienteering release];
	[Recruiting release];
	[MiniBootCamp release];
	[SeaCruise release];
	[NJROTCRates release];
	[NJROTCRanks release];
	[NavyRates release];
	[NavyRanks release];
	[MarineCorpsRates release];
	[MarineCorpsRanks release];
	[NJROTCRatesLabel release];
	[NJROTCRanksLabel release];
	[NavyRatesLabel release];
	[NavyRanksLabel release];
	[MarineCorpsRatesLabel release];
	[MarineCorpsRanksLabel release];
	[MaleGrooming release];
	[FemaleGrooming release];
	[UniformComposition release];
	[AwardsAndDecorations release];
	[DevicePlacement release];
	[MaleGroomingLabel release];
	[FemaleGroomingLabel release];
	[UniformCompositionLabel release];
	[AwardsAndDecorationsLabel release];
	[DevicePlacementLabel release];
	[GeneralOrders release];
	[ImportantDates release];
	[Drill release];
	[TypesOfCommands release];
	[MiscKnowledge release];
	[NavyTerminology release];
	[PhoneticAlphabet release];
	[GeneralOrdersLabel release];
	[ImportantDatesLabel release];
	[DrillLabel release];
	[TypesOfCommandsLabel release];
	[MiscKnowledgeLabel release];
	[NavyTerminologyLabel release];
	[PhoneticAlphabetLabel release];
	[Forwardbutton release];
	[MeritoriousAchievementSelected release];
	[DistinguishedUnitSelected release];
	[DistinguishedCadetSelected release];
	[HonorCadetSelected release];
	[CadetAchievementSelected release];
	[AptitudeSelected release];
	[NavalScienceIVOutstandingCadetSelected release];
	[NavalScienceIIIOutstandingCadetSelected release];
	[NavalScienceIIOutstandingCadetSelected release];
	[NavalScienceIOutstandingCadetSelected release];
	[ExemplaryConductSelected release];
	[AcademicAwardSelected release];
	[ExemplaryPersonalAppereanceSelected release];
	[PhysicalFitnessSelected release];
	[ParticipationSelected release];
	[UnitServiceSelected release];
	[CommunityServiceSelected release];
	[DrillTeamSelected release];
	[ColorGuardSelected release];
	[RifleTeamSelected release];
	[OrienteeringSelected release];
	[RecruitingSelected release];
	[MiniBootCampSelected release];
	[SeaCruiseSelected release];
	[ScrollView release];
	AD.delegate = nil;
	[AD release];
}

- (void)dealloc {
    [super dealloc];
}

@end
