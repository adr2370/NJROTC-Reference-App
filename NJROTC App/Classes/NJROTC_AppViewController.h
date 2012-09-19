//
//  NJROTC_AppViewController.h
//  NJROTC App
//
//  Created by Alexander Ramirez on 8/2/10.
//  Copyright Tryad 2011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface NJROTC_AppViewController : UIViewController<UIScrollViewDelegate> {
	
	IBOutlet UIImageView *Background;
	IBOutlet UIImageView *Backbutton;
	IBOutlet UIScrollView *ScrollView;
	
	//Main screen
	IBOutlet UIImageView *Main;
	IBOutlet UIImageView *Inspection_Knowledge;
	IBOutlet UIImageView *Ribbon_Bar_Maker;
	IBOutlet UIImageView *Credits;
	IBOutlet UILabel *Inspection_KnowledgeLabel;
	IBOutlet UILabel *Ribbon_Bar_MakerLabel;
	IBOutlet UILabel *CreditsLabel;
	
	//Inspection Knowledge
	IBOutlet UIImageView *Chain_of_Command;
	IBOutlet UIImageView *Ribbons;
	IBOutlet UIImageView *Ranks;
	IBOutlet UIImageView *Uniform_Info;
	IBOutlet UIImageView *Misc;
	IBOutlet UILabel *Chain_of_CommandLabel;
	IBOutlet UILabel *RibbonsLabel;
	IBOutlet UILabel *RanksLabel;
	IBOutlet UILabel *Uniform_InfoLabel;
	IBOutlet UILabel *MiscLabel;
	//Chain of Command
	IBOutlet UIImageView *President;
	IBOutlet UIImageView *VicePres;
	IBOutlet UIImageView *SecState;
	IBOutlet UIImageView *SecDef;
	IBOutlet UIImageView *SecNavy;
	IBOutlet UIImageView *Chairman;
	IBOutlet UIImageView *CNO;
	IBOutlet UIImageView *Commandant;
	IBOutlet UIImageView *MCPON;
	IBOutlet UIImageView *SergeantMajor;
	IBOutlet UIImageView *NETC;
	IBOutlet UIImageView *NSTC;
	IBOutlet UIImageView *Director;
	IBOutlet UILabel *PresidentLabel;
	IBOutlet UILabel *VicePresLabel;
	IBOutlet UILabel *SecStateLabel;
	IBOutlet UILabel *SecDefLabel;
	IBOutlet UILabel *SecNavyLabel;
	IBOutlet UILabel *ChairmanLabel;
	IBOutlet UILabel *CNOLabel;
	IBOutlet UILabel *CommandantLabel;
	IBOutlet UILabel *MCPONLabel;
	IBOutlet UILabel *SergeantMajorLabel;
	IBOutlet UILabel *NETCLabel;
	IBOutlet UILabel *NSTCLabel;
	IBOutlet UILabel *DirectorLabel;
	//Ribbons
	IBOutlet UIImageView *MeritoriousAchievement;	
	IBOutlet UIImageView *DistinguishedUnit;
	IBOutlet UIImageView *DistinguishedCadet;	
	IBOutlet UIImageView *HonorCadet;
	IBOutlet UIImageView *CadetAchievement;	
	IBOutlet UIImageView *Aptitude;
	IBOutlet UIImageView *NavalScienceIVOutstandingCadet;	
	IBOutlet UIImageView *NavalScienceIIIOutstandingCadet;	
	IBOutlet UIImageView *NavalScienceIIOutstandingCadet;	
	IBOutlet UIImageView *NavalScienceIOutstandingCadet;
	IBOutlet UIImageView *ExemplaryConduct;
	IBOutlet UIImageView *AcademicAward;
	IBOutlet UIImageView *ExemplaryPersonalAppereance;
	IBOutlet UIImageView *PhysicalFitness;
	IBOutlet UIImageView *Participation;
	IBOutlet UIImageView *UnitService;
	IBOutlet UIImageView *CommunityService;	
	IBOutlet UIImageView *DrillTeam;
	IBOutlet UIImageView *ColorGuard;	
	IBOutlet UIImageView *RifleTeam;
	IBOutlet UIImageView *Orienteering;	
	IBOutlet UIImageView *Recruiting;
	IBOutlet UIImageView *MiniBootCamp;	
	IBOutlet UIImageView *SeaCruise;
	//Ranks
	IBOutlet UIImageView *NJROTCRates;	
	IBOutlet UIImageView *NJROTCRanks;
	IBOutlet UIImageView *NavyRates;	
	IBOutlet UIImageView *NavyRanks;
	IBOutlet UIImageView *MarineCorpsRates;	
	IBOutlet UIImageView *MarineCorpsRanks;
	IBOutlet UILabel *NJROTCRatesLabel;	
	IBOutlet UILabel *NJROTCRanksLabel;
	IBOutlet UILabel *NavyRatesLabel;	
	IBOutlet UILabel *NavyRanksLabel;
	IBOutlet UILabel *MarineCorpsRatesLabel;	
	IBOutlet UILabel *MarineCorpsRanksLabel;
	//Uniform Info
	IBOutlet UIImageView *MaleGrooming;
	IBOutlet UIImageView *FemaleGrooming;
	IBOutlet UIImageView *UniformComposition;
	IBOutlet UIImageView *AwardsAndDecorations;
	IBOutlet UIImageView *DevicePlacement;
	IBOutlet UILabel *MaleGroomingLabel;
	IBOutlet UILabel *FemaleGroomingLabel;
	IBOutlet UILabel *UniformCompositionLabel;
	IBOutlet UILabel *AwardsAndDecorationsLabel;
	IBOutlet UILabel *DevicePlacementLabel;
	//Misc
	IBOutlet UIImageView *GeneralOrders;
	IBOutlet UIImageView *ImportantDates;
	IBOutlet UIImageView *Drill;
	IBOutlet UIImageView *TypesOfCommands;
	IBOutlet UIImageView *MiscKnowledge;
	IBOutlet UIImageView *NavyTerminology;
	IBOutlet UIImageView *PhoneticAlphabet;
	IBOutlet UILabel *GeneralOrdersLabel;
	IBOutlet UILabel *ImportantDatesLabel;
	IBOutlet UILabel *DrillLabel;
	IBOutlet UILabel *TypesOfCommandsLabel;
	IBOutlet UILabel *MiscKnowledgeLabel;
	IBOutlet UILabel *NavyTerminologyLabel;
	IBOutlet UILabel *PhoneticAlphabetLabel;
	
	//Ribbon Bar Maker
	IBOutlet UIImageView *Forwardbutton;
	IBOutlet UIImageView *MeritoriousAchievementSelected;	
	IBOutlet UIImageView *DistinguishedUnitSelected;
	IBOutlet UIImageView *DistinguishedCadetSelected;	
	IBOutlet UIImageView *HonorCadetSelected;
	IBOutlet UIImageView *CadetAchievementSelected;	
	IBOutlet UIImageView *AptitudeSelected;
	IBOutlet UIImageView *NavalScienceIVOutstandingCadetSelected;	
	IBOutlet UIImageView *NavalScienceIIIOutstandingCadetSelected;	
	IBOutlet UIImageView *NavalScienceIIOutstandingCadetSelected;	
	IBOutlet UIImageView *NavalScienceIOutstandingCadetSelected;
	IBOutlet UIImageView *ExemplaryConductSelected;
	IBOutlet UIImageView *AcademicAwardSelected;
	IBOutlet UIImageView *ExemplaryPersonalAppereanceSelected;
	IBOutlet UIImageView *PhysicalFitnessSelected;
	IBOutlet UIImageView *ParticipationSelected;
	IBOutlet UIImageView *UnitServiceSelected;
	IBOutlet UIImageView *CommunityServiceSelected;	
	IBOutlet UIImageView *DrillTeamSelected;
	IBOutlet UIImageView *ColorGuardSelected;	
	IBOutlet UIImageView *RifleTeamSelected;
	IBOutlet UIImageView *OrienteeringSelected;	
	IBOutlet UIImageView *RecruitingSelected;
	IBOutlet UIImageView *MiniBootCampSelected;	
	IBOutlet UIImageView *SeaCruiseSelected;
	
	//Credits
	
	UIImageView *image;
}

@property(nonatomic,retain) IBOutlet UIImageView *Background;
@property(nonatomic,retain) IBOutlet UIImageView *Backbutton;
@property(nonatomic,retain) IBOutlet UIScrollView *ScrollView;
@property(nonatomic,retain) IBOutlet ADBannerView *AD;

//Main screen
@property(nonatomic,retain) IBOutlet UIImageView *Main;
@property(nonatomic,retain) IBOutlet UIImageView *Inspection_Knowledge;
@property(nonatomic,retain) IBOutlet UIImageView *Ribbon_Bar_Maker;
@property(nonatomic,retain) IBOutlet UIImageView *Credits;
@property(nonatomic,retain) IBOutlet UILabel *Inspection_KnowledgeLabel;
@property(nonatomic,retain) IBOutlet UILabel *Ribbon_Bar_MakerLabel;
@property(nonatomic,retain) IBOutlet UILabel *CreditsLabel;

//Inspection Knowledge
@property(nonatomic,retain) IBOutlet UIImageView *Chain_of_Command;
@property(nonatomic,retain) IBOutlet UIImageView *Ribbons;
@property(nonatomic,retain) IBOutlet UIImageView *Ranks;
@property(nonatomic,retain) IBOutlet UIImageView *Uniform_Info;
@property(nonatomic,retain) IBOutlet UIImageView *Misc;
@property(nonatomic,retain) IBOutlet UILabel *Chain_of_CommandLabel;
@property(nonatomic,retain) IBOutlet UILabel *RibbonsLabel;
@property(nonatomic,retain) IBOutlet UILabel *RanksLabel;
@property(nonatomic,retain) IBOutlet UILabel *Uniform_InfoLabel;
@property(nonatomic,retain) IBOutlet UILabel *MiscLabel;
//Chain of Command
@property(nonatomic,retain) IBOutlet UIImageView *President;
@property(nonatomic,retain) IBOutlet UIImageView *VicePres;
@property(nonatomic,retain) IBOutlet UIImageView *SecState;
@property(nonatomic,retain) IBOutlet UIImageView *SecDef;
@property(nonatomic,retain) IBOutlet UIImageView *SecNavy;
@property(nonatomic,retain) IBOutlet UIImageView *Chairman;
@property(nonatomic,retain) IBOutlet UIImageView *CNO;
@property(nonatomic,retain) IBOutlet UIImageView *Commandant;
@property(nonatomic,retain) IBOutlet UIImageView *MCPON;
@property(nonatomic,retain) IBOutlet UIImageView *SergeantMajor;
@property(nonatomic,retain) IBOutlet UIImageView *NETC;
@property(nonatomic,retain) IBOutlet UIImageView *NSTC;
@property(nonatomic,retain) IBOutlet UIImageView *Director;
@property(nonatomic,retain) IBOutlet UILabel *PresidentLabel;
@property(nonatomic,retain) IBOutlet UILabel *VicePresLabel;
@property(nonatomic,retain) IBOutlet UILabel *SecStateLabel;
@property(nonatomic,retain) IBOutlet UILabel *SecDefLabel;
@property(nonatomic,retain) IBOutlet UILabel *SecNavyLabel;
@property(nonatomic,retain) IBOutlet UILabel *ChairmanLabel;
@property(nonatomic,retain) IBOutlet UILabel *CNOLabel;
@property(nonatomic,retain) IBOutlet UILabel *CommandantLabel;
@property(nonatomic,retain) IBOutlet UILabel *MCPONLabel;
@property(nonatomic,retain) IBOutlet UILabel *SergeantMajorLabel;
@property(nonatomic,retain) IBOutlet UILabel *NETCLabel;
@property(nonatomic,retain) IBOutlet UILabel *NSTCLabel;
@property(nonatomic,retain) IBOutlet UILabel *DirectorLabel;
//Ribbons
@property(nonatomic,retain) IBOutlet UIImageView *MeritoriousAchievement;	
@property(nonatomic,retain) IBOutlet UIImageView *DistinguishedUnit;
@property(nonatomic,retain) IBOutlet UIImageView *DistinguishedCadet;	
@property(nonatomic,retain) IBOutlet UIImageView *HonorCadet;
@property(nonatomic,retain) IBOutlet UIImageView *CadetAchievement;	
@property(nonatomic,retain) IBOutlet UIImageView *Aptitude;
@property(nonatomic,retain) IBOutlet UIImageView *NavalScienceIVOutstandingCadet;
@property(nonatomic,retain) IBOutlet UIImageView *NavalScienceIIIOutstandingCadet;	
@property(nonatomic,retain) IBOutlet UIImageView *NavalScienceIIOutstandingCadet;	
@property(nonatomic,retain) IBOutlet UIImageView *NavalScienceIOutstandingCadet;
@property(nonatomic,retain) IBOutlet UIImageView *ExemplaryConduct;
@property(nonatomic,retain) IBOutlet UIImageView *AcademicAward;
@property(nonatomic,retain) IBOutlet UIImageView *ExemplaryPersonalAppereance;
@property(nonatomic,retain) IBOutlet UIImageView *PhysicalFitness;
@property(nonatomic,retain) IBOutlet UIImageView *Participation;
@property(nonatomic,retain) IBOutlet UIImageView *UnitService;
@property(nonatomic,retain) IBOutlet UIImageView *CommunityService;
@property(nonatomic,retain) IBOutlet UIImageView *DrillTeam;
@property(nonatomic,retain) IBOutlet UIImageView *ColorGuard;	
@property(nonatomic,retain) IBOutlet UIImageView *RifleTeam;
@property(nonatomic,retain) IBOutlet UIImageView *Orienteering;
@property(nonatomic,retain) IBOutlet UIImageView *Recruiting;	
@property(nonatomic,retain) IBOutlet UIImageView *MiniBootCamp;	
@property(nonatomic,retain) IBOutlet UIImageView *SeaCruise;
//Ranks
@property(nonatomic,retain) IBOutlet UIImageView *NJROTCRates;	
@property(nonatomic,retain) IBOutlet UIImageView *NJROTCRanks;
@property(nonatomic,retain) IBOutlet UIImageView *NavyRates;
@property(nonatomic,retain) IBOutlet UIImageView *NavyRanks;	
@property(nonatomic,retain) IBOutlet UIImageView *MarineCorpsRates;	
@property(nonatomic,retain) IBOutlet UIImageView *MarineCorpsRanks;
@property(nonatomic,retain) IBOutlet UILabel *NJROTCRatesLabel;	
@property(nonatomic,retain) IBOutlet UILabel *NJROTCRanksLabel;
@property(nonatomic,retain) IBOutlet UILabel *NavyRatesLabel;
@property(nonatomic,retain) IBOutlet UILabel *NavyRanksLabel;	
@property(nonatomic,retain) IBOutlet UILabel *MarineCorpsRatesLabel;	
@property(nonatomic,retain) IBOutlet UILabel *MarineCorpsRanksLabel;
//Uniform Info
@property(nonatomic,retain) IBOutlet UIImageView *MaleGrooming;
@property(nonatomic,retain) IBOutlet UIImageView *FemaleGrooming;
@property(nonatomic,retain) IBOutlet UIImageView *UniformComposition;
@property(nonatomic,retain) IBOutlet UIImageView *AwardsAndDecorations;
@property(nonatomic,retain) IBOutlet UIImageView *DevicePlacement;
@property(nonatomic,retain) IBOutlet UILabel *MaleGroomingLabel;
@property(nonatomic,retain) IBOutlet UILabel *FemaleGroomingLabel;
@property(nonatomic,retain) IBOutlet UILabel *UniformCompositionLabel;
@property(nonatomic,retain) IBOutlet UILabel *AwardsAndDecorationsLabel;
@property(nonatomic,retain) IBOutlet UILabel *DevicePlacementLabel;
//Misc
@property(nonatomic,retain) IBOutlet UIImageView *GeneralOrders;
@property(nonatomic,retain) IBOutlet UIImageView *ImportantDates;
@property(nonatomic,retain) IBOutlet UIImageView *Drill;
@property(nonatomic,retain) IBOutlet UIImageView *TypesOfCommands;
@property(nonatomic,retain) IBOutlet UIImageView *MiscKnowledge;
@property(nonatomic,retain) IBOutlet UIImageView *NavyTerminology;
@property(nonatomic,retain) IBOutlet UIImageView *PhoneticAlphabet;
@property(nonatomic,retain) IBOutlet UILabel *GeneralOrdersLabel;
@property(nonatomic,retain) IBOutlet UILabel *ImportantDatesLabel;
@property(nonatomic,retain) IBOutlet UILabel *DrillLabel;
@property(nonatomic,retain) IBOutlet UILabel *TypesOfCommandsLabel;
@property(nonatomic,retain) IBOutlet UILabel *MiscKnowledgeLabel;
@property(nonatomic,retain) IBOutlet UILabel *NavyTerminologyLabel;
@property(nonatomic,retain) IBOutlet UILabel *PhoneticAlphabetLabel;

//Ribbon Bar Maker
@property(nonatomic,retain) IBOutlet UIImageView *Forwardbutton;
@property(nonatomic,retain) IBOutlet UIImageView *MeritoriousAchievementSelected;	
@property(nonatomic,retain) IBOutlet UIImageView *DistinguishedUnitSelected;
@property(nonatomic,retain) IBOutlet UIImageView *DistinguishedCadetSelected;	
@property(nonatomic,retain) IBOutlet UIImageView *HonorCadetSelected;
@property(nonatomic,retain) IBOutlet UIImageView *CadetAchievementSelected;	
@property(nonatomic,retain) IBOutlet UIImageView *AptitudeSelected;
@property(nonatomic,retain) IBOutlet UIImageView *NavalScienceIVOutstandingCadetSelected;
@property(nonatomic,retain) IBOutlet UIImageView *NavalScienceIIIOutstandingCadetSelected;	
@property(nonatomic,retain) IBOutlet UIImageView *NavalScienceIIOutstandingCadetSelected;	
@property(nonatomic,retain) IBOutlet UIImageView *NavalScienceIOutstandingCadetSelected;
@property(nonatomic,retain) IBOutlet UIImageView *ExemplaryConductSelected;
@property(nonatomic,retain) IBOutlet UIImageView *AcademicAwardSelected;
@property(nonatomic,retain) IBOutlet UIImageView *ExemplaryPersonalAppereanceSelected;
@property(nonatomic,retain) IBOutlet UIImageView *PhysicalFitnessSelected;
@property(nonatomic,retain) IBOutlet UIImageView *ParticipationSelected;
@property(nonatomic,retain) IBOutlet UIImageView *UnitServiceSelected;
@property(nonatomic,retain) IBOutlet UIImageView *CommunityServiceSelected;
@property(nonatomic,retain) IBOutlet UIImageView *DrillTeamSelected;
@property(nonatomic,retain) IBOutlet UIImageView *ColorGuardSelected;	
@property(nonatomic,retain) IBOutlet UIImageView *RifleTeamSelected;
@property(nonatomic,retain) IBOutlet UIImageView *OrienteeringSelected;
@property(nonatomic,retain) IBOutlet UIImageView *RecruitingSelected;	
@property(nonatomic,retain) IBOutlet UIImageView *MiniBootCampSelected;	
@property(nonatomic,retain) IBOutlet UIImageView *SeaCruiseSelected;

//Credits


@end

