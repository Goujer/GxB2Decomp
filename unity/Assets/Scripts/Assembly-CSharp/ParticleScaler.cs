using UnityEngine;

public static class ParticleScaler
{
	public static ParticleScalerOptions defaultOptions;

	public static void ScaleByTransform(ParticleSystem particles, float scale, bool includeChildren = true)
	{
	}

	public static void Scale(ParticleSystem particles, float scale, bool includeChildren = true, ParticleScalerOptions options = null)
	{
	}

	private static void ScaleSystem(ParticleSystem particles, float scale, bool scalePosition, ParticleScalerOptions options = null)
	{
	}

	private static ParticleSystem.MinMaxCurve ScaleMinMaxCurve(ParticleSystem.MinMaxCurve curve, float scale)
	{
		return default(ParticleSystem.MinMaxCurve);
	}

	private static void ScaleCurve(AnimationCurve curve, float scale)
	{
	}
}
