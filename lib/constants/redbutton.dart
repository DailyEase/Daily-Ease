import 'package:flutter/material.dart';
import 'package:daily_ease/constants/colors.dart';
import 'package:daily_ease/constants/text.dart';
import 'package:daily_ease/constants/dimensions.dart';


class RedButton extends StatelessWidget {
	final String label;
	final VoidCallback? onPressed;
	final bool fullWidth;
	final Color? backgroundColor;
	final Color? textColor;
	final double? borderRadius;
	final double elevation;
	final Widget? leading;
	final Widget? trailing;
	final bool loading;

	const RedButton({
		super.key,
		required this.label,
		this.onPressed,
		this.fullWidth = false,
		this.backgroundColor,
		this.textColor,
		this.borderRadius,
		this.elevation = 0,
		this.leading,
		this.trailing,
		this.loading = false,
	});

	@override
	Widget build(BuildContext context) {
		return ResponsiveBuilder(
			builder: (context, dimensions) {
				final bg = backgroundColor ?? AppColor.red;
				final fg = textColor ?? AppColor.black;
				final r = borderRadius ?? dimensions.cardRadius;
				final hPad = dimensions.buttonHPadding;
				final vPad = dimensions.buttonVPadding;
				final content = loading
						? SizedBox(
								height: AppTextTheme.medium14.fontSize! + 4,
								width: AppTextTheme.medium14.fontSize! + 4,
								child: CircularProgressIndicator(
									strokeWidth: 2,
									valueColor: AlwaysStoppedAnimation<Color>(fg),
								),
							)
						: Row(
								mainAxisSize: MainAxisSize.min,
								mainAxisAlignment: MainAxisAlignment.center,
								children: [
									if (leading != null) ...[
										leading!,
										SizedBox(width: dimensions.paddingSmall * 0.5),
									],
									Text(
										label,
										style: AppTextTheme.medium14.copyWith(color: fg),
									),
									if (trailing != null) ...[
										SizedBox(width: dimensions.paddingSmall * 0.5),
										trailing!,
									]
								],
							);

				final button = Material(
					color: bg,
					elevation: elevation,
						shape: RoundedRectangleBorder(
						borderRadius: BorderRadius.circular(r),
					),
					child: InkWell(
						onTap: loading ? null : onPressed,
						borderRadius: BorderRadius.circular(r),
						child: Padding(
							padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
							child: content,
						),
					),
				);
				return fullWidth ? SizedBox(width: double.infinity, child: button) : button;
			},
		);
	}
}
