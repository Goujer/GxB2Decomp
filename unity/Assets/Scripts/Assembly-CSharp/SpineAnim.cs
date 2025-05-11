using System.Collections.Generic;
using System.Runtime.InteropServices;
using Spine;
using Spine.Unity;
using Spine.Unity.Modules;
using UnityEngine;

public class SpineAnim : MonoBehaviour
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void CompleteDelegate();

	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void SpineEventDelegate(Event e);

	public SkeletonAnimation a;

	public SkeletonRenderSeparator b;

	public string effName;

	private UIPanel m_panel;

	private UIWidget m_target;

	private int count;

	private int needtimes;

	private bool inpanel;

	public int targetDelta;

	private MeshRenderer c;

	private UIPanel targetPanel;

	public Vector4 fillColor;

	private Vector3 oldPosition;

	public Vector4 m_clipArea;

	public float fillPhase;

	public float m_alpha;

	public float m_clipRadius;

	public Vector4 m_clipCenter;

	private bool isReset_scroller_m_clipArea;

	private bool isVertical_m_clipArea;

	private GameObject scrollerContent;

	private GameObject scrollerItemContent;

	private Vector4 scrollerClip_BorderItemNum_Border;

	private Vector2 scrollerClip_scrollerContent_TopToDown;

	private float scrollerClip_firstCount_y;

	private Dictionary<string, UITexture> waitChangeUITextures;

	private bool isNewClipShader;

	private int lasetQueue;

	public UIWidget RenderTarget
	{
		get
		{
			return null;
		}
		set
		{
		}
	}

	public float ToAlpha
	{
		get
		{
			return 0f;
		}
		set
		{
		}
	}

	public UIPanel RenderPanel
	{
		get
		{
			return null;
		}
		set
		{
		}
	}

	public float timeScale
	{
		get
		{
			return 0f;
		}
		set
		{
		}
	}

	public bool isNewClipShaderState
	{
		get
		{
			return false;
		}
		set
		{
		}
	}

	private void Start()
	{
	}

	public void play(string name, int times)
	{
	}

	public void playAtTime(string name, int times, float trackTime)
	{
	}

	public void pauseAtFrame(string name, int frame)
	{
	}

	public void startAtFrame(int frame)
	{
	}

	private void OnEnable()
	{
	}

	public void setReverse()
	{
	}

	public void stop()
	{
	}

	public void setToSetupPose()
	{
	}

	public void clearTracksEvent()
	{
	}

	public void pause()
	{
	}

	public void resume()
	{
	}

	public void updateFirstFrame()
	{
	}

	public void playOnTrack(int track, string name, int times)
	{
	}

	private void AddToPanel()
	{
	}

	public void setClip(Vector4 center, float raidus)
	{
	}

	public void clearClip()
	{
	}

	private void OnDisable()
	{
	}

	public void setSeparatorDuration(int num)
	{
	}

	public void setQueue()
	{
	}

	public void setAlphaToFather()
	{
	}

	private Vector4 calClipArea(UIPanel panel)
	{
		return default(Vector4);
	}

	public void setClipAreaWithScroller(GameObject scrollerObj, GameObject scrollerItemObj, float firstCount_y, Vector4 borderItemNum, Vector2 topDown)
	{
	}

	public void reset()
	{
	}

	public void addListener(string eventName, CompleteDelegate callback)
	{
	}

	public void addEvent(SpineEventDelegate callback)
	{
	}

	public AnimationStateData getSkeletonAnimation()
	{
		return null;
	}

	public BoneData getBone(string boneName)
	{
		return null;
	}

	public SlotData getSlot(string slotName)
	{
		return null;
	}

	public EventData findEvent(string eventName)
	{
		return null;
	}

	public void removeAttachment(string slotName)
	{
	}

	public void changeAttachment(string slotName, UITexture texture)
	{
	}

	public void changeRegionAttachmentPosition(string name, Vector3 offset, Vector3 scale, float rotation)
	{
	}

	private Material CreateRegionAttachmentByTexture(Skeleton skeleton, Slot slot, UITexture texture)
	{
		return null;
	}

	private Material CreateMeshAttachmentByTexture(Skeleton skeleton, Slot slot, Texture2D texture)
	{
		return null;
	}

	private Material CreateRegionAttachmentByTexture2(Skeleton skeleton, Slot slot, Texture2D texture)
	{
		return null;
	}

	private AtlasRegion CreateRegion(Texture2D texture)
	{
		return null;
	}

	public void switchAttachment(string slotName, string attachName, string switchAttchName)
	{
	}

	public void hideSlots(string slotName)
	{
	}

	public void setSlot(string slotName, string attachName)
	{
	}

	public float getAnimationTime(string name)
	{
		return 0f;
	}

	public bool hasAnimationName(string name)
	{
		return false;
	}

	public void BuildSkeletonDataAsset(string skeletonPath)
	{
	}

	public void setMaterialNum()
	{
	}

	public void setPanelVector(UIPanel panel)
	{
	}

	public void setAlpha(float value)
	{
	}

	private void LateUpdate()
	{
	}
}
