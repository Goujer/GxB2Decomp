using UnityEngine;

[ExecuteInEditMode]
public class AnimatedAlpha : MonoBehaviour
{
	public float alpha;

	private UIWidget mWidget;

	private UIPanel mPanel;

	private SpriteRenderer[] mSpriteRenderers;

	private Color[] mColor;

	private void OnEnable()
	{
	}

	private void LateUpdate()
	{
	}
}
