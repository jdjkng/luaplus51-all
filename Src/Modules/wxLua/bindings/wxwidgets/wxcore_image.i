// ===========================================================================
// Purpose:     wxImage
// Author:      J Winwood, John Labenski
// Created:     14/11/2001
// Copyright:   (c) 2001-2002 Lomtick Software. All rights reserved.
// Licence:     wxWidgets licence
// wxWidgets:   Updated to 2.8.4
// ===========================================================================


%define wxIMAGE_ALPHA_TRANSPARENT
%define wxIMAGE_ALPHA_THRESHOLD
%define wxIMAGE_ALPHA_OPAQUE

%enum wxBitmapType
    wxBITMAP_TYPE_INVALID
    wxBITMAP_TYPE_BMP
    wxBITMAP_TYPE_BMP_RESOURCE
    wxBITMAP_TYPE_RESOURCE
    wxBITMAP_TYPE_ICO
    wxBITMAP_TYPE_ICO_RESOURCE
    wxBITMAP_TYPE_CUR
    wxBITMAP_TYPE_CUR_RESOURCE
    wxBITMAP_TYPE_XBM
    wxBITMAP_TYPE_XBM_DATA
    wxBITMAP_TYPE_XPM
    wxBITMAP_TYPE_XPM_DATA
    wxBITMAP_TYPE_TIF
    wxBITMAP_TYPE_TIF_RESOURCE
    wxBITMAP_TYPE_GIF
    wxBITMAP_TYPE_GIF_RESOURCE
    wxBITMAP_TYPE_PNG
    wxBITMAP_TYPE_PNG_RESOURCE
    wxBITMAP_TYPE_JPEG
    wxBITMAP_TYPE_JPEG_RESOURCE
    wxBITMAP_TYPE_PNM
    wxBITMAP_TYPE_PNM_RESOURCE
    wxBITMAP_TYPE_PCX
    wxBITMAP_TYPE_PCX_RESOURCE
    wxBITMAP_TYPE_PICT
    wxBITMAP_TYPE_PICT_RESOURCE
    wxBITMAP_TYPE_ICON
    wxBITMAP_TYPE_ICON_RESOURCE
    wxBITMAP_TYPE_ANI
    wxBITMAP_TYPE_IFF
    %wxchkver_2_8 wxBITMAP_TYPE_TGA
    wxBITMAP_TYPE_MACCURSOR
    wxBITMAP_TYPE_MACCURSOR_RESOURCE
    wxBITMAP_TYPE_ANY
%endenum

// ---------------------------------------------------------------------------
// wxImage

%if wxLUA_USE_wxImage && wxUSE_IMAGE

%include "wx/image.h"

%wxchkver_2_6 %define_wxstring wxIMAGE_OPTION_CUR_HOTSPOT_X
%wxchkver_2_6 %define_wxstring wxIMAGE_OPTION_CUR_HOTSPOT_Y

//%define_string wxIMAGE_OPTION_PNG_FORMAT     see wxPNGHandler
//%define_string wxIMAGE_OPTION_PNG_BITDEPTH   see wxPNGHandler
//%define_string wxIMAGE_OPTION_BMP_FORMAT     see wxBMPHandler

%define_wxstring wxIMAGE_OPTION_QUALITY        wxT("quality")
%define_wxstring wxIMAGE_OPTION_FILENAME       wxT("FileName")

%define_wxstring wxIMAGE_OPTION_RESOLUTION     wxT("Resolution")
%define_wxstring wxIMAGE_OPTION_RESOLUTIONX    wxT("ResolutionX")
%define_wxstring wxIMAGE_OPTION_RESOLUTIONY    wxT("ResolutionY")
%define_wxstring wxIMAGE_OPTION_RESOLUTIONUNIT wxT("ResolutionUnit")

%enum
    // constants used with wxIMAGE_OPTION_RESOLUTIONUNIT
    wxIMAGE_RESOLUTION_INCHES
    wxIMAGE_RESOLUTION_CM
%endenum

// Constants for wxImage::Scale() for determining the level of quality
%enum wxImageResizeQuality
    // different image resizing algorithms used by Scale() and Rescale()
    %wxchkver_2_9_2 wxIMAGE_QUALITY_NEAREST
    %wxchkver_2_9_2 wxIMAGE_QUALITY_BILINEAR
    %wxchkver_2_9_2 wxIMAGE_QUALITY_BICUBIC
    %wxchkver_2_9_2 wxIMAGE_QUALITY_BOX_AVERAGE

    // default quality is low (but fast)
    %wxchkver_2_8 wxIMAGE_QUALITY_NORMAL

    // highest (but best) quality
    %wxchkver_2_8 wxIMAGE_QUALITY_HIGH
%endenum



%class %delete wxImage, wxObject
    %define_object wxNullImage

    wxImage()
    wxImage(const wxImage& image)
    wxImage(int width, int height, bool clear=true)
    wxImage(const wxString& name, long type = wxBITMAP_TYPE_ANY)

    // %override wxImage(int width, int height, unsigned char* data, bool static_data = false)
    // C++ Func: wxImage(int width, int height, unsigned char* data, bool static_data = false)
    %override_name wxLua_wxImageFromData_constructor wxImage(int width, int height, unsigned char* data, bool static_data = false)

    // %override wxLua provides this constructor
    %override_name wxLua_wxImageFromBitmap_constructor wxImage(const wxBitmap& bitmap)

    static void AddHandler(%ungc wxImageHandler* handler)
    %wxchkver_2_8 wxImage Blur(int radius)
    %wxchkver_2_8 wxImage BlurHorizontal(int radius)
    %wxchkver_2_8 wxImage BlurVertical(int radius)
    static void CleanUpHandlers()
    unsigned long ComputeHistogram(wxImageHistogram& histogram) const
    //wxBitmap ConvertToBitmap() const - deprecated use wxBitmap constructor
    %wxchkver_2_8 wxImage ConvertToGreyscale( double lr = 0.299, double lg = 0.587, double lb = 0.114 ) const
    wxImage ConvertToMono(unsigned char r, unsigned char g, unsigned char b) const
    wxImage Copy() const
    void Create(int width, int height, bool clear=true)
    void Destroy()

    // %override [bool, uchar r, uchar g, char b] wxImage::FindFirstUnusedColour(unsigned char startR = 1, unsigned char startG = 0, unsigned char startB = 0)
    // C++ Func: bool FindFirstUnusedColour(unsigned char* r, unsigned char* g, unsigned char* b, unsigned char startR = 1, unsigned char startG = 0, unsigned char startB = 0)
    bool FindFirstUnusedColour(unsigned char startR = 1, unsigned char startG = 0, unsigned char startB = 0)

    static wxImageHandler* FindHandler(const wxString& name)
    static wxImageHandler* FindHandler(const wxString& extension, long imageType)
    static wxImageHandler* FindHandler(long imageType)
    static wxImageHandler* FindHandlerMime(const wxString& mimetype)
    static wxString GetImageExtWildcard()
    unsigned char GetAlpha(int x, int y) const
    unsigned char GetBlue(int x, int y) const

    // %override [Lua string] wxImage::GetData() const
    // C++ Func: unsigned char* GetData() const
    unsigned char* GetData() const

    unsigned char GetGreen(int x, int y) const
    static int GetImageCount(const wxString& filename, wxBitmapType type = wxBITMAP_TYPE_ANY)
    static int GetImageCount(wxInputStream& stream, wxBitmapType type = wxBITMAP_TYPE_ANY)
    static wxList& GetHandlers()
    int GetHeight() const
    unsigned char GetMaskBlue() const
    unsigned char GetMaskGreen() const
    unsigned char GetMaskRed() const

    // %override [bool, uchar r, uchar g, uchar b] wxImage::GetOrFindMaskColour() const
    // C++ Func: bool GetOrFindMaskColour(unsigned char *r, unsigned char *g, unsigned char *b) const
    bool GetOrFindMaskColour() const

    wxPalette GetPalette() const
    unsigned char GetRed(int x, int y) const
    wxImage GetSubImage(const wxRect& rect) const
    int GetWidth() const

    // note: we're tricking generator to not gag on RGB/HSVValue, so pretend to return an int
    // %override [r, g, b] wxImage::HSVtoRGB(double h, double s, double v)
    // C++ Func: static RGBValue HSVtoRGB(const HSVValue& hsv)
    static int HSVtoRGB(double h, double s, double v)

    // %override [h, s, v] wxImage::RGBtoHSV(unsigned char r, unsigned char g, unsigned char b)
    // C++ Func: static HSVValue RGBtoHSV(const RGBValue& rgb)
    static int RGBtoHSV(unsigned char r, unsigned char g, unsigned char b)

    bool HasAlpha() const
    bool HasMask() const
    wxString GetOption(const wxString &name) const
    int GetOptionInt(const wxString &name) const
    int HasOption(const wxString &name) const
    void InitAlpha()
    static void InitStandardHandlers()
    static void InsertHandler(%ungc wxImageHandler* handler)
    bool IsTransparent(int x, int y, unsigned char threshold = 128) const

    bool LoadFile(const wxString& name, wxBitmapType type = wxBITMAP_TYPE_ANY, int index = -1)
    bool LoadFile(const wxString& name, const wxString& mimetype, int index = -1)
    bool LoadFile(wxInputStream& stream, wxBitmapType type = wxBITMAP_TYPE_ANY, int index = -1)
    bool LoadFile(wxInputStream& stream, const wxString& mimetype, int index = -1)

    bool Ok() const
    static bool RemoveHandler(const wxString& name)
    wxImage Mirror(bool horizontally = true) const
    void Replace(unsigned char r1, unsigned char g1, unsigned char b1, unsigned char r2, unsigned char g2, unsigned char b2)
    %wxchkver_2_8 wxImage ResampleBox(int width, int height) const
    %wxchkver_2_8 wxImage ResampleBicubic(int width, int height) const
    !%wxchkver_2_8 wxImage& Rescale(int width, int height)
    %wxchkver_2_8 wxImage& Rescale( int width, int height, wxImageResizeQuality quality = wxIMAGE_QUALITY_NORMAL )
    wxImage& Resize(const wxSize& size, const wxPoint& pos, int red = -1, int green = -1, int blue = -1)
    wxImage Rotate(double angle, const wxPoint& rotationCentre, bool interpolating = true, wxPoint* offsetAfterRotation = NULL)
    void RotateHue(double angle)
    wxImage Rotate90(bool clockwise = true) const
    bool SaveFile(const wxString& name)
    bool SaveFile(const wxString& name, int type)
    bool SaveFile(const wxString& name, const wxString& mimetype)
    !%wxchkver_2_8 wxImage Scale(int width, int height) const
    %wxchkver_2_8 wxImage Scale( int width, int height, wxImageResizeQuality quality = wxIMAGE_QUALITY_NORMAL ) const
    wxImage Size(const wxSize& size, const wxPoint& pos, int red = -1, int green = -1, int blue = -1) const
    void SetAlpha(int x, int y, unsigned char alpha)

    // %override void wxImage::SetAlpha(Lua string) - copy contents of string to image
    // C++ Func: void SetAlpha(unsigned char *alpha = NULL,bool static_data = false)
    %override_name wxLua_wxImage_SetAlphaData void SetAlpha(const wxString& dataStr)

    // %override void wxImage::SetData(Lua string) - copy contents of string to image
    // C++ Func: void SetData(unsigned char *data)
    void SetData(const wxString& data)

    void SetMask(bool hasMask = true)
    void SetMaskColour(unsigned char red, unsigned char blue, unsigned char green)
    bool SetMaskFromImage(const wxImage& mask, unsigned char mr, unsigned char mg, unsigned char mb)
    void SetOption(const wxString &name, const wxString &value)
    void SetOption(const wxString &name, int value)
    void SetPalette(const wxPalette& palette)
    void SetRGB(int x, int y, unsigned char red, unsigned char green, unsigned char blue)
    void SetRGB(wxRect& rect, unsigned char red, unsigned char green, unsigned char blue)

    %operator wxImage& operator=(const wxImage& image)
    //%operator bool operator==(const wxImage& image) const // not in 2.8
%endclass

// ---------------------------------------------------------------------------
// wxImageHistogram

%class %delete wxImageHistogramEntry
    wxImageHistogramEntry()
    %member unsigned long index // GetIndex() only, SetIndex(idx) is not allowed
    %member unsigned long value // GetValue() and SetValue(val)
%endclass

%class %delete wxImageHistogram::iterator
    %member long first
    %member wxImageHistogramEntry second

    // operator used to compare with wxImageHistogram::end() iterator
    %operator bool operator==(const wxImageHistogram::iterator& other) const

    //%operator wxImageHistogram::iterator& operator++() // it just returns *this
    %operator void operator++() // it's best if we don't return the iterator
%endclass

%class %delete wxImageHistogram // wxImageHistogramBase actually a hash map
    wxImageHistogram()

    // get the key in the histogram for the given RGB values
    static unsigned long MakeKey(unsigned char r, unsigned char g, unsigned char b)

    // Use the function wxImage::FindFirstUnusedColour
    //bool FindFirstUnusedColour(unsigned char *r, unsigned char *g, unsigned char *b, unsigned char startR = 1, unsigned char startG = 0, unsigned char startB = 0 ) const

    // Selected functions from the base wxHashMap class
    wxImageHistogram::iterator begin() const // not const iterator since we create a new copy of it
    void clear()
    size_t count(long key) const
    bool empty() const
    wxImageHistogram::iterator end() const // not const iterator since we create a new copy of it
    size_t erase(long key)
    wxImageHistogram::iterator find(long key)
    //Insert_Result insert(const value_type& v)
    size_t size() const
    //mapped_type& operator[](const key_type& key)

%endclass

// ---------------------------------------------------------------------------
// wxQuantize

%include "wx/quantize.h"

%define wxQUANTIZE_INCLUDE_WINDOWS_COLOURS
%define wxQUANTIZE_RETURN_8BIT_DATA
%define wxQUANTIZE_FILL_DESTINATION_IMAGE

%class wxQuantize, wxObject
    // No constructor - all methods static

    // %override bool wxQuantize::Quantize(const wxImage& src, wxImage& dest, int desiredNoColours = 236, int flags = wxQUANTIZE_INCLUDE_WINDOWS_COLOURS|wxQUANTIZE_FILL_DESTINATION_IMAGE|wxQUANTIZE_RETURN_8BIT_DATA);
    // C++ Func: static bool Quantize(const wxImage& src, wxImage& dest, wxPalette** pPalette, int desiredNoColours = 236, unsigned char** eightBitData = 0, int flags = wxQUANTIZE_INCLUDE_WINDOWS_COLOURS|wxQUANTIZE_FILL_DESTINATION_IMAGE|wxQUANTIZE_RETURN_8BIT_DATA);
    static bool Quantize(const wxImage& src, wxImage& dest, int desiredNoColours = 236, int flags = wxQUANTIZE_INCLUDE_WINDOWS_COLOURS|wxQUANTIZE_FILL_DESTINATION_IMAGE|wxQUANTIZE_RETURN_8BIT_DATA);

    //static bool Quantize(const wxImage& src, wxImage& dest, int desiredNoColours = 236, unsigned char** eightBitData = 0, int flags = wxQUANTIZE_INCLUDE_WINDOWS_COLOURS|wxQUANTIZE_FILL_DESTINATION_IMAGE|wxQUANTIZE_RETURN_8BIT_DATA);
    //static void DoQuantize(unsigned w, unsigned h, unsigned char **in_rows, unsigned char **out_rows, unsigned char *palette, int desiredNoColours);

%endclass

// ---------------------------------------------------------------------------
// wxImageHandler and derived classes

%class %delete wxImageHandler, wxObject
    // no constructor - abstract class

    wxString GetName() const
    wxString GetExtension() const
    int GetImageCount(wxInputStream& stream)
    long GetType() const
    wxString GetMimeType() const
    bool LoadFile(wxImage* image, wxInputStream& stream, bool verbose=true, int index=0)
    bool SaveFile(wxImage* image, wxOutputStream& stream)
    void SetName(const wxString& name)
    void SetExtension(const wxString& extension)
    void SetMimeType(const wxString& mimetype)
    void SetType(long type)
%endclass

// ---------------------------------------------------------------------------
// wxBMPHandler and friends in imagbmp.h

%include "wx/imagbmp.h"

%enum
    wxBMP_24BPP
    //wxBMP_16BPP  - remmed out in wxWidgets
    wxBMP_8BPP
    wxBMP_8BPP_GREY
    wxBMP_8BPP_GRAY
    wxBMP_8BPP_RED
    wxBMP_8BPP_PALETTE
    wxBMP_4BPP
    wxBMP_1BPP
    wxBMP_1BPP_BW
%endenum

%define_wxstring wxIMAGE_OPTION_BMP_FORMAT wxT("wxBMP_FORMAT") // wxString(wxT("wxBMP_FORMAT"))

%class %delete wxBMPHandler, wxImageHandler
    wxBMPHandler()
%endclass

%if wxUSE_ICO_CUR

%class %delete wxICOHandler, wxBMPHandler
    wxICOHandler()
%endclass

%class %delete wxCURHandler, wxICOHandler
    wxCURHandler()
%endclass

%class %delete wxANIHandler, wxCURHandler
    wxANIHandler()
%endclass

%endif // wxUSE_ICO_CUR

// ---------------------------------------------------------------------------
// wxIFFHandler and friends in imagiff.h

%include "wx/imagiff.h"

%if wxUSE_IFF

%class %delete wxIFFHandler, wxImageHandler
    wxIFFHandler()
%endclass

%endif //wxUSE_IFF

// ---------------------------------------------------------------------------
// wxGIFHandler and friends in imaggif.h

%include "wx/imaggif.h"

%if wxUSE_GIF

%class %delete wxGIFHandler, wxImageHandler
    wxGIFHandler()
%endclass

%endif //wxUSE_GIF

// ---------------------------------------------------------------------------
// wxJPEGHandler and friends in imagjpeg.h

%include "wx/imagjpeg.h"

%if wxUSE_LIBJPEG

%class %delete wxJPEGHandler, wxImageHandler
    wxJPEGHandler()
%endclass

%endif //wxUSE_LIBJPEG

// ---------------------------------------------------------------------------
// wxPCXHandler and friends in imagpcx.h

%include "wx/imagpcx.h"

%if wxUSE_PCX

%class %delete wxPCXHandler, wxImageHandler
    wxPCXHandler()
%endclass

%endif //wxUSE_PCX

// ---------------------------------------------------------------------------
// wxPNGHandler and friends in imagpng.h

%include "wx/imagpng.h"

%if wxUSE_LIBPNG

%define_wxstring wxIMAGE_OPTION_PNG_FORMAT    // wxT("PngFormat")
%define_wxstring wxIMAGE_OPTION_PNG_BITDEPTH  // wxT("PngBitDepth")

%enum
    wxPNG_TYPE_COLOUR
    wxPNG_TYPE_GREY
    wxPNG_TYPE_GREY_RED
%endenum

%class %delete wxPNGHandler, wxImageHandler
    wxPNGHandler()
%endclass

%endif //wxUSE_LIBPNG

// ---------------------------------------------------------------------------
// wxPNMHandler and friends in imagpnm.h

%include "wx/imagpnm.h"

%if wxUSE_PNM

%class %delete wxPNMHandler, wxImageHandler
    wxPNMHandler()
%endclass

%endif //wxUSE_PNM

// ---------------------------------------------------------------------------
// wxTIFFHandler and friends in imagtiff.h

%include "wx/imagtiff.h"

%if wxUSE_LIBTIFF

%define_wxstring wxIMAGE_OPTION_BITSPERSAMPLE   wxT("BitsPerSample")
%define_wxstring wxIMAGE_OPTION_SAMPLESPERPIXEL wxT("SamplesPerPixel")
%define_wxstring wxIMAGE_OPTION_COMPRESSION     wxT("Compression")
%define_wxstring wxIMAGE_OPTION_IMAGEDESCRIPTOR wxT("ImageDescriptor")

%class %delete wxTIFFHandler, wxImageHandler
    wxTIFFHandler()
%endclass

%endif //wxUSE_LIBTIFF

// ---------------------------------------------------------------------------
// wxTGAHandler and friends in imagtga.h

%if %wxchkver_2_8 && wxUSE_TGA

%include "wx/imagtga.h"

%class %delete wxTGAHandler, wxImageHandler
    wxTGAHandler()
%endclass

%endif // %wxchkver_2_8 && wxUSE_TGA

// ---------------------------------------------------------------------------
// wxXPMHandler and friends in imagxpm.h

%include "wx/imagxpm.h"

%class %delete wxXPMHandler, wxImageHandler
    wxXPMHandler()
%endclass


%endif //wxLUA_USE_wxImage && wxUSE_IMAGE

// ---------------------------------------------------------------------------
// wxArtProvider and friends

%if wxLUA_USE_wxArtProvider

%include "wx/artprov.h"

//%typedef wxString wxArtClient   Just treat these as wxStrings
//%typedef wxString wxArtID

// ----------------------------------------------------------------------------
// Art clients
// ----------------------------------------------------------------------------

%if %wxchkver_2_9_0
%define_string wxART_TOOLBAR
%define_string wxART_MENU
%define_string wxART_FRAME_ICON

%define_string wxART_CMN_DIALOG
%define_string wxART_HELP_BROWSER
%define_string wxART_MESSAGE_BOX
%define_string wxART_BUTTON

%define_string wxART_OTHER
%endif

%if !%wxchkver_2_9_0
%define_wxstring wxART_TOOLBAR
%define_wxstring wxART_MENU
%define_wxstring wxART_FRAME_ICON

%define_wxstring wxART_CMN_DIALOG
%define_wxstring wxART_HELP_BROWSER
%define_wxstring wxART_MESSAGE_BOX
%define_wxstring wxART_BUTTON

%define_wxstring wxART_OTHER
%endif

// ----------------------------------------------------------------------------
// Art IDs
// ----------------------------------------------------------------------------

%if %wxchkver_2_9_0
%define_string wxART_ADD_BOOKMARK
%define_string wxART_DEL_BOOKMARK
%define_string wxART_HELP_SIDE_PANEL
%define_string wxART_HELP_SETTINGS
%define_string wxART_HELP_BOOK
%define_string wxART_HELP_FOLDER
%define_string wxART_HELP_PAGE
%define_string wxART_GO_BACK
%define_string wxART_GO_FORWARD
%define_string wxART_GO_UP
%define_string wxART_GO_DOWN
%define_string wxART_GO_TO_PARENT
%define_string wxART_GO_HOME
%define_string wxART_FILE_OPEN
%define_string wxART_FILE_SAVE
%define_string wxART_FILE_SAVE_AS
%define_string wxART_PRINT
%define_string wxART_HELP
%define_string wxART_TIP
%define_string wxART_REPORT_VIEW
%define_string wxART_LIST_VIEW
%define_string wxART_NEW_DIR
%define_string wxART_HARDDISK
%define_string wxART_FLOPPY
%define_string wxART_CDROM
%define_string wxART_REMOVABLE
%define_string wxART_FOLDER
%define_string wxART_FOLDER_OPEN
%define_string wxART_GO_DIR_UP
%define_string wxART_EXECUTABLE_FILE
%define_string wxART_NORMAL_FILE
%define_string wxART_TICK_MARK
%define_string wxART_CROSS_MARK
%define_string wxART_ERROR
%define_string wxART_QUESTION
%define_string wxART_WARNING
%define_string wxART_INFORMATION
%define_string wxART_MISSING_IMAGE
%define_string wxART_COPY
%define_string wxART_CUT
%define_string wxART_PASTE
%define_string wxART_DELETE
%define_string wxART_NEW

%define_string wxART_UNDO
%define_string wxART_REDO

%define_string wxART_QUIT

%define_string wxART_FIND
%define_string wxART_FIND_AND_REPLACE
%endif

%if !%wxchkver_2_9_0
%define_wxstring wxART_ADD_BOOKMARK
%define_wxstring wxART_DEL_BOOKMARK
%define_wxstring wxART_HELP_SIDE_PANEL
%define_wxstring wxART_HELP_SETTINGS
%define_wxstring wxART_HELP_BOOK
%define_wxstring wxART_HELP_FOLDER
%define_wxstring wxART_HELP_PAGE
%define_wxstring wxART_GO_BACK
%define_wxstring wxART_GO_FORWARD
%define_wxstring wxART_GO_UP
%define_wxstring wxART_GO_DOWN
%define_wxstring wxART_GO_TO_PARENT
%define_wxstring wxART_GO_HOME
%define_wxstring wxART_FILE_OPEN
%define_wxstring wxART_FILE_SAVE
%define_wxstring wxART_FILE_SAVE_AS
%define_wxstring wxART_PRINT
%define_wxstring wxART_HELP
%define_wxstring wxART_TIP
%define_wxstring wxART_REPORT_VIEW
%define_wxstring wxART_LIST_VIEW
%define_wxstring wxART_NEW_DIR
%define_wxstring wxART_HARDDISK
%define_wxstring wxART_FLOPPY
%define_wxstring wxART_CDROM
%define_wxstring wxART_REMOVABLE
%define_wxstring wxART_FOLDER
%define_wxstring wxART_FOLDER_OPEN
%define_wxstring wxART_GO_DIR_UP
%define_wxstring wxART_EXECUTABLE_FILE
%define_wxstring wxART_NORMAL_FILE
%define_wxstring wxART_TICK_MARK
%define_wxstring wxART_CROSS_MARK
%define_wxstring wxART_ERROR
%define_wxstring wxART_QUESTION
%define_wxstring wxART_WARNING
%define_wxstring wxART_INFORMATION
%define_wxstring wxART_MISSING_IMAGE
%define_wxstring wxART_COPY
%define_wxstring wxART_CUT
%define_wxstring wxART_PASTE
%define_wxstring wxART_DELETE
%define_wxstring wxART_NEW

%define_wxstring wxART_UNDO
%define_wxstring wxART_REDO

%define_wxstring wxART_QUIT

%define_wxstring wxART_FIND
%define_wxstring wxART_FIND_AND_REPLACE
%endif

%class wxArtProvider, wxObject
    // wxArtProvider() - abstract class

    %if %wxchkver_2_8
        static void Push(%ungc wxArtProvider *provider)
        static void Insert(%ungc wxArtProvider *provider)
        static bool Pop()
        static bool Remove(%gc wxArtProvider *provider) // FIXME - mem leak if not found
        static bool Delete(%ungc wxArtProvider *provider)
    %endif // %wxchkver_2_8

    //%if !%wxcompat_2_6
    //static void PushProvider(wxArtProvider *provider) FIXME add wxLuaArtProvider maybe?
    //static bool PopProvider()
    //static bool RemoveProvider(wxArtProvider *provider)
    //%endif // !%wxcompat_2_6

    static wxBitmap GetBitmap(const wxString& id, const wxString& client = wxART_OTHER, const wxSize& size = wxDefaultSize)
    static wxIcon GetIcon(const wxString& id, const wxString& client = wxART_OTHER, const wxSize& size = wxDefaultSize)
    static wxSize GetSizeHint(const wxString& client, bool platform_dependent = false)
%endclass

%class %delete wxLuaArtProvider, wxArtProvider
    // %override - the C++ function takes the wxLuaState as the first param
    wxLuaArtProvider()

    // virtual function that you can override in Lua.
    virtual wxSize DoGetSizeHint(const wxString& client) // { return GetSizeHint(client, true); }

    // virtual function that you can override in Lua.

    // Derived classes must override this method to create requested
    // art resource. This method is called only once per instance's
    // lifetime for each requested wxArtID.
    virtual wxBitmap CreateBitmap(const wxString& id, const wxString& client, const wxSize& size);

%endclass

%endif //wxLUA_USE_wxArtProvider
