import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';
import '../../domain/models/partner.dart';
import '../widgets/partner_card.dart';

class PartnersScreen extends StatelessWidget {
  const PartnersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    final List<Partner> partners = [
      Partner(
        id: '1',
        name: appLocalizations.partnerBanlasticName,
        description: appLocalizations.partnerBanlasticDescription,
        logo: 'assets/images/partners/Banlastic Egypt.png',
        website: 'https://www.facebook.com/BanlasticEgypt',
        activities: [
          appLocalizations.partnerBanlasticActivity1,
          appLocalizations.partnerBanlasticActivity2,
          appLocalizations.partnerBanlasticActivity3,
        ],
        partnershipDetails: appLocalizations.partnerBanlasticPartnership,
      ),
      Partner(
        id: '2',
        name: appLocalizations.partnerGreenishName,
        description: appLocalizations.partnerGreenishDescription,
        logo: 'assets/images/partners/Greenish.png',
        website: 'https://www.facebook.com/GreenishEgy',
        activities: [
          appLocalizations.partnerGreenishActivity1,
          appLocalizations.partnerGreenishActivity2,
          appLocalizations.partnerGreenishActivity3,
        ],
        partnershipDetails: appLocalizations.partnerGreenishPartnership,
      ),
      Partner(
        id: '3',
        name: appLocalizations.partnerVeryNileName,
        description: appLocalizations.partnerVeryNileDescription,
        logo: 'assets/images/partners/VeryNile.jpeg',
        website: 'https://verynile.org',
        activities: [
          appLocalizations.partnerVeryNileActivity1,
          appLocalizations.partnerVeryNileActivity2,
          appLocalizations.partnerVeryNileActivity3,
        ],
        partnershipDetails: appLocalizations.partnerVeryNilePartnership,
      ),
      Partner(
        id: '4',
        name: appLocalizations.partnerYLEName,
        description: appLocalizations.partnerYLEDescription,
        logo: 'assets/images/partners/Youth Loves Egypt.jpeg',
        website: 'https://www.facebook.com/YouthLovesEgypt',
        activities: [
          appLocalizations.partnerYLEActivity1,
          appLocalizations.partnerYLEActivity2,
          appLocalizations.partnerYLEActivity3,
        ],
        partnershipDetails: appLocalizations.partnerYLEPartnership,
      ),
      Partner(
        id: '5',
        name: appLocalizations.partnerBekiaName,
        description: appLocalizations.partnerBekiaDescription,
        logo: 'assets/images/partners/Bekia.png',
        website: 'https://bekia.eg',
        activities: [
          appLocalizations.partnerBekiaActivity1,
          appLocalizations.partnerBekiaActivity2,
          appLocalizations.partnerBekiaActivity3,
        ],
        partnershipDetails: appLocalizations.partnerBekiaPartnership,
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          appLocalizations.partnersTitle,
          style: AppTypography.h2.copyWith(color: AppColors.grey900),
        ),
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: partners.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final partner = partners[index];
          return PartnerCard(
            partner: partner,
            fit: index >= 2 ? BoxFit.cover : BoxFit.contain,
            onTap: () async {
              final url = Uri.parse(partner.website);
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
          );
        },
      ),
    );
  }
}