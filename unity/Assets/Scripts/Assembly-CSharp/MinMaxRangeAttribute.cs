using UnityEngine;

public class MinMaxRangeAttribute : PropertyAttribute
{
	public float minLimit;

	public float maxLimit;

	public MinMaxRangeAttribute(float minLimit, float maxLimit)
	{
	}
}
