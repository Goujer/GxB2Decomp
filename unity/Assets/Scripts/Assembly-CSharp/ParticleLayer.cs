using UnityEngine;

public class ParticleLayer : MonoBehaviour
{
	public enum RenderType
	{
		NONE = 0,
		FRONT = 1,
		BACK = 2
	}

	[HideInInspector]
	[SerializeField]
	protected int mDepth;

	[HideInInspector]
	[SerializeField]
	protected UIWidget mTarget;

	[HideInInspector]
	[SerializeField]
	protected RenderType mType;

	[HideInInspector]
	[SerializeField]
	public bool useSharedMatrl;

	protected Renderer[] mRenderers;

	protected int mLastQueue;

	protected bool mInit;

	public int depth
	{
		get
		{
			return 0;
		}
		set
		{
		}
	}

	public UIWidget target
	{
		get
		{
			return null;
		}
		set
		{
		}
	}

	public RenderType type
	{
		get
		{
			return default(RenderType);
		}
		set
		{
		}
	}

	private void Start()
	{
	}

	public void AddToPanel()
	{
	}

	public void RemoveFromPanel()
	{
	}

	public void UpdateUISort()
	{
	}

	private void OnDestroy()
	{
	}
}
